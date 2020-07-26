class SessionsController < ApplicationController

  def create
    @user = User.find_or_create_by(username: auth["info"]["email"])
    if !@user.password
      @user.password = SecureRandom.hex
    end
    @user.save
    session[:user_id] = @user.id
    redirect_to user_path(@user)
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