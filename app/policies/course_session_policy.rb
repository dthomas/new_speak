class CourseSessionPolicy < ApplicationPolicy
	def new?
		user.loginable_type.nil?
	end

	def edit?
		user.loginable_type.nil?
	end
end