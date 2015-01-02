class ClassGroupPolicy < ApplicationPolicy
	def create?
		manager? || principal?
	end

	def show?
		manager? || principal? || class_teacher?
	end
end