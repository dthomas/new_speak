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
		user.id == record.teaching_assignment.teacher.id
	end

	def show?
		user.id == record.teaching_assignment.teacher.id
	end

	def grade?
		user.id == record.teaching_assignment.teacher.id
	end
end