class AssessmentsController < ApplicationController
	def new
		@teaching_assignment = current_account.teaching_assignments.find(params[:teaching_assignment_id])
		@assessment = current_account.assessments.build
	end

	def create
		@teaching_assignment = current_account.teaching_assignments.find(params[:teaching_assignment_id])
		@assessment = current_account.assessments.build(assessment_params)
		@assessment.teaching_assignment = @teaching_assignment
		if @assessment.save
			redirect_to @teaching_assignment, notice: "Assessment has been created successfully"
		else
			render :new
		end
	end

	def show
		@assessment = current_account.assessments.find(params[:id])
	end

	def edit
		@assessment = current_account.assessments.find(params[:id])
	end

	def update
		@assessment = current_account.assessments.find(params[:id])
		if @assessment.update(assessment_params)
			redirect_to @assessment, notice: "#{@assessment.title} has been updated"
		else
			render :edit
		end
	end

	private

	def assessment_params
		params.require(:assessment).permit(:title, :description, :due_date, :weightage, :maximum_marks, :strategy)
	end
end
