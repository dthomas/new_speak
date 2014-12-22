class AcademicTermsController < ApplicationController
	def new
		@course = current_account.courses.find(params[:course_id])
		@term = @course.academic_terms.build
	end

	def create
		@course = current_account.courses.find(params[:course_id])
		@term = @course.academic_terms.build(academic_term_params)
		@term.institute = current_account

		if @term.save
			redirect_to @course, notice: "New term #{@term.title} created"
		else
			render :new
		end
	end

	def show
		@term = current_account.academic_terms.find(params[:id])
		@course = @term.course
	end

	private

	def academic_term_params
		params.require(:academic_term).permit(:title, :code, :course_type)
	end
end
