class ClassGroupPolicy < ApplicationPolicy
	def show?
		class_teacher? || principal? || class_teacher?
	end
end