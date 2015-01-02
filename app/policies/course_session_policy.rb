class CourseSessionPolicy < ApplicationPolicy
	def create?
		manager? || principal?
	end

	def update?
		manager? || principal?
	end
end