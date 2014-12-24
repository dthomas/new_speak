class ClassGroup < ActiveRecord::Base
	include VerifyInstitute

	# Associations

  belongs_to :course_session, inverse_of: :class_groups
  belongs_to :institute, inverse_of: :class_groups

  has_many :class_group_students, inverse_of: :class_group
  has_many :teaching_assignments, inverse_of: :class_group
  has_many :course_subjects, through: :teaching_assignments, inverse_of: :class_groups
  has_many :teachers, through: :teaching_assignments, inverse_of: :class_groups
  has_many :course_subjects, through: :teaching_assignments, inverse_of: :class_group
  has_many :students, -> { uniq } ,through: :class_group_students, inverse_of: :class_groups

  # Validations

  validates :name, presence: true, uniqueness: { case_sensistive: false, scope: [:course_session_id, :institute_id] }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :course_session, presence: true
  validates :institute, presence: true

  # Scopes

  scope :active, -> { where('? BETWEEN start_date AND end_date', Date.today) }

  # Nested Attributes

  accepts_nested_attributes_for :class_group_students
  accepts_nested_attributes_for :teaching_assignments, reject_if: :teaching_assignment_is_invalid?

  def teaching_assignment_is_invalid?(attributes)
    attributes[:course_subject_id].blank? || attributes[:teacher_id].blank?
  end
end
