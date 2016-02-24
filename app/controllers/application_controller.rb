class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :current_user
  before_action :require_login


  def current_user
   @current_user ||= User.find(session[:user_id]) if session[:user_id]
   rescue ActiveRecord::RecordNotFound
  end

  def require_login
    unless current_user
      flash[:error] = "Please log in"
      redirect_to root_path
    end
  end

end
