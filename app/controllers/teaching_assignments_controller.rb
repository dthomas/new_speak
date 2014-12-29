class TeachingAssignmentsController < ApplicationController
	def show
		@teaching_assignment = current_account.teaching_assignments.find(params[:id])
	end
end
