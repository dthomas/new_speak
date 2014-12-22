class CourseSubjectsController < ApplicationController
	def new
		@term = current_account.academic_terms.find(params[:academic_term_id])
		@course = @term.course
		@subject = @term.course_subjects.build
	end

	def create
		@term = current_account.academic_terms.find(params[:academic_term_id])
		@course = @term.course
		@subject = @term.course_subjects.build(course_subject_params)
		@subject.institute = current_account

		if @subject.save
			redirect_to @term, notice: "New subject #{@subject.title} created"
		else
			render :new
		end
	end

	private

	def course_subject_params
		params.require(:course_subject).permit(:title, :code, :teaching_hours, :weightage, :grade_points)
	end
end
