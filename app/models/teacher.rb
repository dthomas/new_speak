class Teacher < ActiveRecord::Base
	# Associations

  belongs_to 	:user
  belongs_to 	:institute
  has_one 		:personal_profile, as: :profileable

  # Validations

  validates :date_of_joining, presence: true
  validates :employee_number, presence: true

  # Nested Attributes
  accepts_nested_attributes_for :personal_profile
end
