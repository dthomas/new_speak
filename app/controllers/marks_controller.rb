class MarksController < ApplicationController
	def edit
		@task = current_account.tasks.find(params[:id])
		@assessment = @task.assessment
	end

	def update
		@task = current_account.tasks.find(params[:id])
		@assessment = @task.assessment

		if @task.update(marks_params)
			redirect_to @task, notice: "Marks updated"
		else
			render :edit
		end
	end

	private

	def marks_params
		params.require(:task).permit(task_results_attributes: [:id, :marks_obtained])
	end
end
