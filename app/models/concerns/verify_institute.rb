module VerifyInstitute
	extend ActiveSupport::Concern

	included do
		validates :institute, presence: true
	end
end