class AssessmentPolicy < ApplicationPolicy
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
	def create?
		user.id == record.tutorial.teacher.id
	end

	def show?
		user.id == record.tutorial.teacher.id
	end

	def update?
		user.id == record.tutorial.teacher.id
	end
end