class CoursesController < ApplicationController
  
  def index
  	@courses = policy_scope(Course)
    authorize @courses
  end

  def new
    @course = current_account.courses.build
    2.times { @course.academic_terms.build(institute: current_account) }
    authorize @course
  end

  def create
    @course = current_account.courses.build(course_params)
    authorize @course
    if @course.save
      redirect_to courses_path, notice: "New course #{@course.name} created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @course = current_account.courses.find(params[:id])
    authorize @course
  end

  private

  def course_params
  	params.require(:course).permit(:name, :abbreviation,
  		academic_terms_attributes: [:title, :code, :term_type, :term_class ,:institute_id])
  end
end
