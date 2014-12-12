class StudentsController < ApplicationController
  def index
  	@course_sessions ||= current_account.course_sessions
  	@students = []
  	if params[:session_id]
  		@students = @course_sessions.find(params[:session_id]).students
  	end
  end

  def show
  	@student = current_account.students.find(params[:id])
  end
end
