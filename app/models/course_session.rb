class CourseSession < ActiveRecord::Base
  # Associations

  belongs_to :course, inverse_of: :course_sessions
  belongs_to :institute, inverse_of: :course_sessions

  has_many :course_session_participants
  has_many :students, through: :course_session_participants

  # Validations

  validates :course, presence: true
  validates :institute, presence: true
  validates :name, presence: true, uniqueness: { case_sensitive: false, scope: [:course_id, :institute_id] }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :terms, presence:true, numericality: true
  validates :current_term, presence:true, numericality: true

  # Scopes
  scope :admissions_open, -> { where(admissions_open: true) }
  scope :admissions_closed, -> { where(admissions_open: false) }
end
