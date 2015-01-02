class CourseSubjectPolicy < ApplicationPolicy
	def new?
		manager? || principal?
	end

	def show?
		subject_teacher? || manager? || principal?
	end
end