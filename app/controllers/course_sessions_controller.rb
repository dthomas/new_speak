class CourseSessionsController < ApplicationController
  def new
  	@course = current_account.courses.find(params[:course_id])
  	@course_session = @course.course_sessions.build
  end

  def create
  	@course = current_account.courses.find(params[:course_id])
  	@course_session = @course.course_sessions.build(course_session_params)
  	@course_session.institute = current_account
  	if @course_session.save
  		redirect_to courses_path, notice: "New Course Session Added" and return
  	else
  		render :new
  	end
  end

  private

  def course_session_params
  	params.require(:course_session).permit(:name, :start_date, :end_date, :terms, :current_term, :admissions_open)
  end
end
