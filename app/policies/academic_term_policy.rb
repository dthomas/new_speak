class AcademicTermPolicy < ApplicationPolicy
	def show?
		manager? || principal?
	end
end