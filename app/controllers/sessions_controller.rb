class SessionsController < ApplicationController
  def new
  	@user ||= User.new
  end

  def create
  	institute = Institute.find_by('subdomain = ? OR custom_domain = ?', request.host, request.host)
  	user = institute.users.find_by(email: params[:user][:email]) || User.new
  	if user.authenticate(params[:user][:password])
  		session[:user_id] = user.id
  		session[:account] = request.host
  		redirect_to new_account_path
  	else
  		@user = User.new(email: user.email)
  		@user.errors.add(:password, "Invalid email or password")
  		render :new, status: :unauthorized
  	end
  end
end
