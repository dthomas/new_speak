class TeachersController < ApplicationController

	def index
		@teachers = current_account.teachers
	end

  def new
  	today = Date.today.to_formatted_s(:rfc822)
  	@teacher = current_account.teachers.build(date_of_joining: today)
  	@teacher.build_personal_profile(institute: current_account)
  end

  def create
  	@teacher = current_account.teachers.build(teacher_params)
  	@teacher.employee_number = current_account.last_employee_number + 1
  	if @teacher.save
  		Institute.increment_counter(:last_employee_number, current_account)
  		redirect_to teachers_path, notice: "New teacher joined successfully"
  	else
  		p @teacher.errors
  		render :new
  	end
  end

  def show
  	@teacher = current_account.teachers.find(params[:id])
    @course_subjects = @teacher.course_subjects
  end

  def edit
    @teacher = current_account.teachers.find(params[:id])
    if @teacher.user.blank?
      @teacher.build_user(institute: current_account)
    else
      @teacher.user = nil
    end
  end

  def update
    @teacher = current_account.teachers.find(params[:id])
    if @teacher.update(teacher_params)
      redirect_to @teacher, notice: "The information has been updated"
    else
      render :new
    end
  end

  private

  def teacher_params
  	params.require(:teacher).permit(:date_of_joining,
  		personal_profile_attributes: [:first_name, :middle_name, :last_name, :date_of_birth, :gender, :institute_id],
      user_attributes: [:email, :password, :password_confirmation, :institute_id])
  end
end
