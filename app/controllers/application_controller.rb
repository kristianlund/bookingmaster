class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticate_user
    if current_user.nil?
      Rails.logger.info("no user")
      redirect_to '/sessions/new'
    end
  end
end
