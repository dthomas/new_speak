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
		user.manager? || user.teacher?
	end

	def show?
		index?
	end

	def create?
		user.manager?
	end
end