class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?

  rescue_from ActiveRecord::RecordNotFound, :with => :rescue404
  # rescue_from ActionController::RoutingError, :with => :rescue404

  private

  def rescue404
    render file: "#{Rails.root}/public/404.html", layout: false, status: 404
  end

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
    authenticate
    redirect_to user_path(current_user) if user != current_user
  end 
end
