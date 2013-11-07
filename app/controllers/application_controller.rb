class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authorize

  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find_by_uid(session[:user_uid]) if session[:user_uid]
  end

  def authorize
    redirect_to '/auth/github/' unless current_user
  end
end
