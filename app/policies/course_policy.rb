class CoursePolicy < ApplicationPolicy
	class Scope
		attr_reader :user, :scope

		def initialize(user, scope)
			@user = user
			@scope = scope
		end

		def resolve
			scope.where(institute_id: user.institute_id)
		end
	end

	def index?
		user.loginable.nil? || user.loginable_type == "Teacher"
	end

	def show?
		index?
	end

	def create?
		user.loginable.nil?
	end
end