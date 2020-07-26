class SessionsController < ApplicationController

  def create
    @user = User.find_or_create_by(username: auth["info"]["email"])
    if !@user.password
      @user.password = SecureRandom.hex
    end
    @user.save
    session[:user_id] = @user.id
    redirect_to books_path
  end

  private

  def auth
    request.env["omniauth.auth"]
  end

end