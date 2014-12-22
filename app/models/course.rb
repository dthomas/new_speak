class Course < ActiveRecord::Base
	# Associations

  belongs_to :institute, inverse_of: :courses
  has_many :course_sessions, inverse_of: :course, autosave: true, dependent: :destroy
  has_many :course_session_participants, through: :course_sessions
  has_many :students, through: :course_session_participants
  has_many :academic_terms, inverse_of: :course, dependent: :destroy

  # Validations

  validates :institute, presence: true
  validates :name, presence: true, uniqueness: { case_sensitive: false, scope: :institute_id }
  validates :abbreviation, presence: true, uniqueness: { case_sensitive: false, scope: :institute_id }

  # Nested Attributes

  accepts_nested_attributes_for :academic_terms, reject_if: :term_is_invalid?

  def term_is_invalid?(attributes)
    attributes[:title].blank? && attributes[:code].blank?
  end
end
