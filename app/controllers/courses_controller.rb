class CoursesController < ApplicationController
  
  def index
  	@courses = current_account.courses
  end

  def new
  	@course = current_account.courses.build
  	@course.course_sessions.build(institute: current_account)
  end

  def create
  	@course = current_account.courses.build(course_params)
  	if @course.save
  		redirect_to courses_path, notice: "New course #{@course.name} created"
  	else
  		render :new, status: :unprocessable_entity
  	end
  end

  def show
    @course = current_account.courses.find(params[:id])
  end

  private

  def course_params
  	params.require(:course).permit(:name, :abbreviation,
  		course_sessions_attributes: [:name, :start_date, :end_date, :terms, :current_term, :institute_id])
  end
end
