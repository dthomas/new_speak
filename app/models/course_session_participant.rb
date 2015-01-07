class CourseSessionParticipant < ActiveRecord::Base
  # Associations

  belongs_to :student, class_name: "Person", foreign_key: "person_id"
  belongs_to :course_session
  belongs_to :institute

  # Validations

  validates :institute, presence: true
end
