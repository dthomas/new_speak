class AssessmentsController < ApplicationController
	def new
		@teaching_assignment = current_account.teaching_assignments.find(params[:teaching_assignment_id])
		@assessment = current_account.assessments.build(teaching_assignment: @teaching_assignment)
		authorize @assessment
	end

	def create
		@teaching_assignment = current_account.teaching_assignments.find(params[:teaching_assignment_id])
		@assessment = current_account.assessments.build(assessment_params)
		@assessment.teaching_assignment = @teaching_assignment
		authorize @assessment
		@teaching_assignment.class_group.students.each do |student|
			@assessment.assessment_results.build(marks_obtained: 0.0, student: student, institute: current_account)
		end

		if @assessment.save
			redirect_to @teaching_assignment, notice: "Assessment has been created successfully"
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

	def grade
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

	private

	def assessment_params
		params.require(:assessment).permit(:title, :description, :due_date, :weightage, :maximum_marks, :strategy)
	end
end
