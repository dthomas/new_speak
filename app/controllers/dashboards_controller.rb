class DashboardsController < ApplicationController
	skip_after_action :verify_policy_scoped
  def index
  	authorize :dashboard, :index?
  	@type = current_user.role.try(:downcase)
  end
end
