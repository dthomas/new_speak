class Teacher < ActiveRecord::Base
	# Associations

  belongs_to :user
  belongs_to :person
  belongs_to :institute

  # Validations

  validates :date_of_joining, presence: true
  validates :employee_number, presence: true
end
