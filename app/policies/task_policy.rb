class TaskPolicy < ApplicationPolicy
	def create?
		user.id == record.assessment.teaching_assignment.teacher.id
	end

	def update?
		user.id == record.assessment.teaching_assignment.teacher.id
	end
end