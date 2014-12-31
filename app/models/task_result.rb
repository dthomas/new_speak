class TaskResult < ActiveRecord::Base
  # Associations

  belongs_to :task
  belongs_to :assessment_result
  belongs_to :student
  belongs_to :institute

  # Validations

  validates :student, presence: true
  validates :task, presence: true
  validates :assessment_result, presence: true
  validates :institute, presence: true
  validates :marks_obtained, presence: true, numericality: true
  validate :marks_obtained_is_within_allowed_range

  def marks_obtained_is_within_allowed_range
  	if marks_obtained && marks_obtained < 0
  		errors.add(:marks_obtained, "can't be less than zero")
  	elsif marks_obtained && task && self.marks_obtained > task.maximum_marks
  		errors.add(:marks_obtained, "can't be greater than maximum marks for this task #{task.maximum_marks}")
  	end
  end
end
