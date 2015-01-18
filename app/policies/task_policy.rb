class TaskPolicy < ApplicationPolicy
	def create?
		user.id == record.assessment.tutorial.teacher.id
	end

	def update?
		user.id == record.assessment.tutorial.teacher.id
	end
end