class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :ensure_authenticated

  private

  def current_account
  	@current_account ||= current_user.institute if current_user
  end

  def current_user
  	warden.try(:user)
  end

  def signed_in?
  	current_user
  end

  def ensure_authenticated
    redirect_to new_session_path, status: :unauthorized unless signed_in?
  end

  def warden
    env['warden']
  end

  helper_method :current_user, :current_account, :signed_in?
end
