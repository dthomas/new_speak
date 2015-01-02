class TeachingAssignmentPolicy < ApplicationPolicy
	def show?
		subject_teacher?
	end
end