class TeachingAssignmentsController < ApplicationController
	def show
		@teaching_assignment = current_account.teaching_assignments.find(params[:id])
		authorize @teaching_assignment
	end
end
