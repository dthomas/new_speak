class AccountsController < ApplicationController
  skip_before_action :ensure_authenticated
  
  def new
  	@institute ||= Institute.new
  	@institute.people.manager.build
  end

  def create
  	@institute = Institute.new(account_params)
  	if @institute.save
  		@institute.update(owner: @institute.people.manager.first)
  		redirect_to new_session_path, notice: "Account created successfully! Please check your email."
  	else
  		render :new
  	end
  end

  private

  def account_params
  	params.require(:institute).permit(:name, :abbreviation, :subdomain, :phone,
  		users_attributes: [:email, :password, :password_confirmation])
  end
end
