class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?
  helper_method :owns_resource?

  # rescue_from ActiveRecord::RecordNotFound, :with => :rescue404
  # rescue_from ActionController::RoutingError, :with => :rescue404
  # rescue_from ActionController::InvalidAuthenticityToken, :with => :rescue403
  # rescue_from Errors::AuthorizationError, :with => :rescue403

  # def routing_error(error = 'Routing error', status = :not_found, exception=nil)
  #   render file: "#{Rails.root}/public/404.html", layout: false, status: 404
  # end

  private

  # def rescue404
  #   render file: "#{Rails.root}/public/404.html", layout: false, status: 404
  # end

  # def rescue403
  #   render file: "#{Rails.root}/public/403.html", layout: false, status: 403
  # end

  def owns_resource?(resource)
    resource.user == current_user
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
    raise Errors::AuthorizationError.new if !owns_resource?(resource)
  end

  def authorize_resources(resources)
    resources.each do |resource|
      authorize(resource)
    end
  end

end
