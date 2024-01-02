class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  # rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  def authenticate_user!
    redirect_to login_path unless current_user
  end

  def current_user
    @current_user ||= begin
      return nil unless session[:user_id]

      User.find(session[:user_id])
    end
  end

  def logged_in?
    session[:user_id] == nil
  end

  def redirect_to_lists
    redirect_to lists_path
  end
end
