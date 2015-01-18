class AssessmentsController < ApplicationController
	def new
		@tutorial = current_account.tutorials.find(params[:tutorial_id])
		@assessment = current_account.assessments.build(tutorial: @tutorial)
		authorize @assessment
	end

	def create
		@tutorial = current_account.tutorials.find(params[:tutorial_id])
		@assessment = current_account.assessments.build(assessment_params)
		@assessment.tutorial = @tutorial
		authorize @assessment
		@tutorial.class_group.students.each do |student|
			@assessment.assessment_results.build(marks_obtained: 0.0, student: student, institute: current_account)
		end

		if @assessment.save
			redirect_to @tutorial, notice: "Assessment has been created successfully"
		else
			render :new
		end
	end

	def show
		@assessment = current_account.assessments.find(params[:id])
		authorize @assessment
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
		params.require(:assessment).permit(:title, :description, :due_date, :weightage, :maximum_marks, :strategy, :assessment_type)
	end
end
