class ClassGroupStudent < ActiveRecord::Base
	# Associations

  belongs_to :class_group
  belongs_to :student
  belongs_to :institute

  # Validations
  include VerifyInstitute
  validates :student, presence: true
  validates :class_group, presence: true
  validates :roll_number, numericality: true
end
