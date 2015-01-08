class GradesController < ApplicationController
	def update
		assessment = policy_scope(Assessment).find(params[:id])
		authorize assessment
		tasks = assessment.tasks
		total_weightage = 0
		tasks.each do |task|
			total_weightage += task.weightage
		end

		if total_weightage != 100
			flash[:alert] = "The sum weightage of all the tasks should be exactly 100"
			redirect_to assessment and return
		end

		assessment.assessment_results.each do |result|
			total_marks = 0
			result.task_results.each do |task_result|
				total_marks += (task_result.marks_obtained) * (task_result.task.weightage/100)
			end
			result.update(GradingService.assign_grade(assessment.term_class, total_marks.round))
		end

		redirect_to assessment, notice: "Grading has been completed"
	end
end
