class TasksController < ApplicationController
	def new
		@assessment = current_account.assessments.find(params[:assessment_id])
		@task = @assessment.tasks.build
	end

	def create
		@assessment = current_account.assessments.find(params[:assessment_id])
		@task = @assessment.tasks.build(task_params)
		@task.institute = current_account
		
		@assessment.assessment_results.each do |result|
			@task.task_results.build(marks_obtained: 0.0, student_id: result.student.id, assessment_result: result, institute: current_account)
		end

		if @task.save
			redirect_to @assessment, notice: "#{@task.name} was added to the assessment"
		else
			render :new
		end
	end

	def show
		@task = current_account.tasks.find(params[:id])
		@assessment = @task.assessment
	end

	def marks
		@task = current_account.tasks.find(params[:id])
		@assessment = @task.assessment
	end

	def marks_update
		@task = current_account.tasks.find(params[:id])
		@assessment = @task.assessment

		if @task.update(marks_params)
			redirect_to @task, notice: "Marks updated"
		else
			render :marks
		end
	end

	private

	def task_params
		params.require(:task).permit(:name, :description, :due_date, :maximum_marks, :weightage)
	end

	def marks_params
		params.require(:task).permit(task_results_attributes: [:id, :marks_obtained])
	end
end
