class UsersController < ApplicationController
  
  def dashboard
    authenticate
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def most_reviews
    authenticate
    @users = User.most_reviews
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end