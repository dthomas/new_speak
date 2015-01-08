class ClassGroupStudent < ActiveRecord::Base
	# Associations

  belongs_to :class_group, inverse_of: :class_group_students
  belongs_to :student, class_name: "Person"

  # Validations
  validates :student, presence: true
  validates :class_group, presence: true
end
