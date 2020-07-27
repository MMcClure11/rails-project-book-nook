class ApplicationController < ActionController::Base

  helper_method :current_user
  helper_method :logged_in?

  

  def require_login
    if current_user
      current_user
    else
      redirect_to root_path
    end
  end

  def authorize(user)
    if user.id != current_user.id
      redirect_to user_path(current_user)
    end
  end

  private

  def logged_in?
    !!current_user
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def log_in(user)
    session[:user_id] = user.id
  end

end
