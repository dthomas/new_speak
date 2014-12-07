class PersonType < ActiveRecord::Base
	# Associations

	has_many :people

	# Validations
	
	validates :name, presence: true
end
