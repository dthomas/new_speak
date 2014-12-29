class DashboardsController < ApplicationController
  def index
  	@type = current_user.loginable_type.try(:downcase) || "default"
  end
end
