class Student < ActiveRecord::Base
	# Associations

  belongs_to :institute
  belongs_to :family, inverse_of: :students

  has_one  :personal_profile, as: :profileable
  has_many :course_session_participants
  has_many :parents, through: :family
  has_many :siblings, through: :family, source: :student, class_name: "Student"
  has_many :course_sessions, through: :course_session_participants
  has_many :courses, through: :course_sessions
  has_many :class_group_students
  has_many :class_groups, through: :class_group_students

  # Validations

  validates :institute, presence: true

  validates :date_of_admission, presence: true
  validates :admission_number, presence: true

  # Nested Attributes
  accepts_nested_attributes_for :personal_profile

  # Delegations
  delegate  :first_name, :middle_name, :last_name, :date_of_birth, :gender,
            to: :personal_profile

  # Instance Methods
  def name
    "#{first_name} #{middle_name} #{last_name}"
  end
end
