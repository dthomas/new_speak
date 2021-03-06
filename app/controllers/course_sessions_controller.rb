class CourseSessionsController < ApplicationController
  def new
  	@course = current_account.courses.find(params[:course_id])
  	@course_session = @course.course_sessions.build
    authorize @course_session
    2.times { @course_session.class_groups.build(institute_id: current_account.id) }
  end

  def create
  	@course = current_account.courses.find(params[:course_id])
  	@course_session = @course.course_sessions.build(course_session_params)
  	@course_session.institute = current_account
  	if @course_session.save
  		redirect_to courses_path, notice: "New Course Session Added"
  	else
  		render :new
  	end
  end

  def show
    @course_session = current_account.course_sessions.find(params[:id])
    authorize @course_session
    @students = @course_session.students
  end

  def edit
    @course_session = current_account.course_sessions.find(params[:id])
    authorize @course_session
    2.times { @course_session.class_groups.build(institute_id: current_account.id) }
  end

  def update
    @course_session = current_account.course_sessions.find(params[:id])
    if @course_session.update(course_session_params)
      redirect_to @course_session, notice: "#{@course_session.name} updated successfully"
    else
      render :edit
    end
  end

  private

  def course_session_params
  	params.require(:course_session).permit(:name, :start_date, :end_date, :terms, :current_term_id, :admissions_open,
      class_groups_attributes: [:id, :name, :start_date, :end_date, :course_session_id, :institute_id])
  end
end
