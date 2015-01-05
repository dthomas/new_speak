class AdmissionsController < ApplicationController
	def new
		@course_session = current_account.course_sessions.find(params[:course_session_id])
	end
end