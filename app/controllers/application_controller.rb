class ApplicationController < ActionController::Base

  helper_method :current_user
  helper_method :logged_in?

  def authorize(user)
    if user.id != current_user.id
      redirect_to user_path(current_user)
    end
  end

  private

  def log_in(user)
    session[:user_id] = user.id
  end

  def logged_in?
    !!current_user
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def authenticate
    redirect_to login_path if !logged_in?
  end

end
