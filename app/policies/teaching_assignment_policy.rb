class TeachingAssignmentPolicy < ApplicationPolicy
	def create?
		manager? || principal?
	end

	def show?
		subject_teacher?
	end
end