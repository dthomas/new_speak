class CourseSession < ActiveRecord::Base
  # Associations

  belongs_to :course
  belongs_to :institute

  # Validations

  validates :course, presence: true
  validates :institute, presence: true
  validates :name, presence: true, uniqueness: { case_sensitive: false, scope: [:course_id, :institute_id] }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :terms, presence:true, numericality: true
  validates :current_term, presence:true, numericality: true
end
