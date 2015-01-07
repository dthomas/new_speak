class AdmissionsController < ApplicationController
	def index
		@course_sessions = current_account.course_sessions.admissions_open
	end

	def new
		@course_session = current_account.course_sessions.find(params[:course_session_id])
		@student = Person.student.new
		2.times { @student.relatives.build }
	end

	def create
		@course_session = current_account.course_sessions.find(params[:course_session_id])
		@student = current_account.people.student.build(admission_params)
		@student.admission_number = current_account.last_admission_number + 1
		@student.relatives.map do |relative|
			relative.institute = current_account
			relative.role = :guardian
		end

		if @student.save
			Institute.increment_counter(:last_admission_number, current_account)
			CourseSessionParticipant.create(student: @student, course_session: @course_session, institute: current_account)
			redirect_to @course_session, notice: "Admission for #{@student.name} (Admission # #{@student.admission_number}) completed"
		else
			render :new
		end
	end

	private

	def admission_params
		params.require(:student).permit(
			:first_name, :middle_name, :last_name, :date_of_birth, :date_of_admission, :gender, :religion, :caste,
				relatives_attributes: 
				[:id, :first_name, :middle_name, :last_name, :date_of_birth, :gender, :relation, :occupation, :religion, :caste])
	end
end