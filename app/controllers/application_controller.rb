class ApplicationController < ActionController::Base

  helper_method :current_user
  helper_method :logged_in?

  

  private

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def authenticate
    redirect_to login_path if !logged_in?
  end

  def authorize(resource)
    authenticate
    redirect_to books_path if resource.user != current_user
  end

  def authorize_user(user)
    #authenticate
    redirect_to user_path(current_user) if user != current_user
  end #####when not logged_in, instead of redirecting to login page it skips authenticate, why?

end
