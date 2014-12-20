class SessionsController < ApplicationController
  skip_before_action :ensure_authenticated, except: :destroy
  
  def new
    redirect_to dashboards_path, notice: "You are already signed in." and return if signed_in?
    flash.now.alert = warden.message if (warden && warden.message.present?)
  end

  def create
  	user = warden.authenticate!
    redirect_to dashboards_path, notice: "Signed In"
  end

  def destroy
    warden.logout
    redirect_to new_session_path, notice: "You have been signed out"
  end
end
