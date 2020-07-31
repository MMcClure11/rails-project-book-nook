class SessionsController < ApplicationController

  def git_create
    @user = User.find_or_create_by(username: auth["info"]["nickname"])
    if !@user.password
      @user.password = SecureRandom.hex
    end
    @user.save
    session[:user_id] = @user.id
    redirect_to dashboard_path
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      log_in(@user)
      flash[:success] = "Welcome, #{@user.username}"
      redirect_to dashboard_path
    else
      flash[:danger] = "Invalid Credentials Given"
      render :new
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

  private

  def auth
    request.env["omniauth.auth"]
  end

end