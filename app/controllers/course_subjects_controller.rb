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

	def edit
		@subject = current_account.course_subjects.find(params[:id])
		@term = @subject.academic_term
		@course = @term.course
	end

	def show
		@subject = current_account.course_subjects.find(params[:id])
		@assignments = current_account.teaching_assignments.where(course_subject: @subject)
	end

	def update
		@subject = current_account.course_subjects.find(params[:id])
		if @subject.update(course_subject_params)
			redirect_to @subject, notice: "#{@subject.title} has been updated"
		else
			@term = @subject.academic_term
			@course = @term.course
			render :edit	
		end
	end

	private

	def course_subject_params
		params.require(:course_subject).permit(:title, :code, :teaching_hours, :weightage, :grade_points)
	end
end
