class Course < ActiveRecord::Base
	# Associations

  belongs_to :institute, inverse_of: :courses
  has_many :course_sessions, inverse_of: :course, autosave: true, dependent: :destroy
  has_many :course_session_participants, through: :course_sessions
  has_many :students, through: :course_session_participants

  # Validations

  validates :institute, presence: true
  validates :name, presence: true, uniqueness: { case_sensitive: false, scope: :institute_id }
  validates :abbreviation, presence: true, uniqueness: { case_sensitive: false, scope: :institute_id }

  # Nested Attributes

  accepts_nested_attributes_for :course_sessions
end
