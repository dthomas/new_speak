class AdmissionsController < ApplicationController
  def index
  	@course_sessions = current_account.course_sessions
  end

  def new
    @course_session = current_account.course_sessions.find(params[:id]) || CourseSession.new
    redirect_to admissions_path, notice: "That course session does not exist" and return unless @course_session.valid?
    @family = current_account.families.build
    student = @family.students.build(date_of_admission: Date.today, date_of_leaving: @course_session.end_date, institute: current_account)
    student.build_personal_profile(institute: current_account)
    2.times do 
      parent = @family.parents.build(institute: current_account)
      parent.build_personal_profile(institute: current_account)
    end
  end

  def create
    @family = current_account.families.build(admission_params)
    @family.students.last.admission_number = current_account.last_admission_number + 1
  	@course_session = current_account.course_sessions.find(params[:course_session_id]) || CourseSession.new
    @participant = current_account.course_session_participants.build(course_session: @course_session, student: @family.students.last)
    if @family.save && @participant.save
      Institute.increment_counter(:last_admission_number, current_account)
      redirect_to admissions_path, notice: "Thank you."
    else
      p @family.errors
      render :new
    end
  end

  private

  def admission_params
    params.require(:family).permit(:name, :institute_id,
      students_attributes:  [:id, :date_of_admission, :date_of_leaving,:institute_id,
        personal_profile_attributes: [:id, :first_name, :middle_name, :last_name, :gender, :date_of_birth, :institute_id]],
      parents_attributes: [:id, :relation, :institute_id,
        personal_profile_attributes: [:id, :first_name, :middle_name, :last_name, :gender, :date_of_birth, :institute_id]],
      )
  end
end
