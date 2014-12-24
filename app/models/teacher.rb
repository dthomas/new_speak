class Teacher < ActiveRecord::Base
	# Associations

  belongs_to 	:user
  belongs_to  :institute
  belongs_to 	:family, inverse_of: :teacher
  has_one 		:personal_profile, as: :profileable
  has_many    :teaching_assignments
  has_many    :course_subjects, through: :teaching_assignments, inverse_of: :teachers
  has_many    :class_groups, through: :teaching_assignments, inverse_of: :teachers

  # Validations

  # validates :institute, presence: true
  include VerifyInstitute
  validates :date_of_joining, presence: true
  validates :employee_number, presence: true

  # Nested Attributes
  accepts_nested_attributes_for :personal_profile

  # Scopes

  scope :active, -> { where(date_of_leaving: nil) }

  # Delegations

  delegate  :first_name, :middle_name, :last_name, :gender, :date_of_birth,
            to: :personal_profile

  # Instance Methods
  def name
    "#{first_name} #{last_name}"
  end

  def name_with_employee_number
    "#{first_name} #{middle_name} #{last_name} [Id: #{employee_number}]"
  end
end
