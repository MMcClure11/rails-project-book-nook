class UsersController < ApplicationController
  before_action :authenticate, only: [:show]
  
  def show #why does this never redirect to login when a non-logged_in user tries to access a user show page?
    @user = User.find(params[:id])
    authorize_user(@user)
  end

  def dashboard
    authenticate
    @user = current_user
    authorize_user(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to user_path(@user)
    else
      @errors = @user.errors.full_messages 
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end