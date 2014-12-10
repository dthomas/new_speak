class CourseSessionParticipant < ActiveRecord::Base
  # Associations

  belongs_to :student
  belongs_to :course_session
  belongs_to :institute

  # Validations

  validates :institute, presence: true
end
