class AcademicTerm < ActiveRecord::Base
	#Enum

	enum term_type: [:year, :semester, :trimester]

	# Associations

  belongs_to :course
  belongs_to :institute
  has_many :course_sessions
  has_many :course_subjects, inverse_of: :academic_term

  # Validations
  validates :course, presence: true
  validates :institute, presence: true
  validates :term_type, presence: true
  validates :term_class, presence: true
  validates :title, presence: true, uniqueness: { case_sensitive: false, scope: [:course_id, :institute_id] }
  validates :code, presence: true, uniqueness: { case_sensitive: false, scope: [:course_id, :institute_id] }

  # Nested Attributes

  accepts_nested_attributes_for :course_subjects
end
