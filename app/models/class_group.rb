class ClassGroup < ActiveRecord::Base
	include VerifyInstitute

	# Associations

  belongs_to :class_teacher, class_name: "Person"
  belongs_to :course_session, inverse_of: :class_groups
  belongs_to :institute, inverse_of: :class_groups

  has_many :class_group_students, inverse_of: :class_group
  has_many :tutorials, inverse_of: :class_group
  has_many :course_subjects, through: :tutorials, inverse_of: :class_groups
  has_many :teachers, through: :tutorials, inverse_of: :class_groups
  has_many :course_subjects, through: :tutorials, inverse_of: :class_group
  # has_many :students, -> { uniq } ,through: :class_group_students, inverse_of: :class_groups, class_name: "Person", source: :person
  has_many :students, through: :class_group_students, source: :student

  # Validations

  validates :name, presence: true, uniqueness: { case_sensistive: false, scope: [:course_session_id, :institute_id] }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :term_class, presence: true
  validates :class_teacher, presence: true
  validates :course_session, presence: true
  validates :institute, presence: true

  validate :term_class_matches_upstream

  # Scopes

  scope :active, -> { where('? BETWEEN start_date AND end_date', Date.today) }

  # Delegations

  # Nested Attributes

  accepts_nested_attributes_for :class_group_students
  accepts_nested_attributes_for :tutorials, reject_if: :tutorial_is_invalid?

  def tutorial_is_invalid?(attributes)
    attributes[:course_subject_id].blank? || attributes[:teacher_id].blank?
  end

  def term_class_matches_upstream
    if course_session && term_class != course_session.term_class 
      errors.add(:term_class, "doesn't match the upstream value")
    end
  end
end
