class TeacherPolicy < ApplicationPolicy
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
		true
	end

	def create?
		manager?
	end
end