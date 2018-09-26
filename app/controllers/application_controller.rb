class ApplicationController < ActionController::Base
   protect_from_forgery with: :exception
   before_action :current_user
   before_action :require_login, except: [:new, :create, :home]

  def home
  end

  private

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def require_login
    redirect_to root_path unless logged_in?
  end

end
