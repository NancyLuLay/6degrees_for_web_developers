class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def user_signed_in?
    session[:user_id].present?
  end
  helper_method :user_signed_in?

  def current_user
    @current_user ||= User.find session[:user_id]
  end
  helper_method :current_user

  def authenticate_user!
    redirect_to new_session_path unless user_signed_in?
  end

end
