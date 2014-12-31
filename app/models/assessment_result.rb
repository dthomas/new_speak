class AssessmentResult < ActiveRecord::Base
  # Assocaitions

  belongs_to 	:student
  belongs_to 	:assessment
  belongs_to 	:institute
  has_many 		:task_results

  # Validations
  validates :student, presence: true
  validates :assessment, presence: true
  validates :institute, presence: true
  validates :marks_obtained, presence: true, numericality: true
  validate :marks_obtained_is_within_range

  def marks_obtained_is_within_range
  	if assessment && marks_obtained < 0
  		errors.add(:marks_obtained, "can't be less than zero")
  	elsif assessment && marks_obtained > assessment.maximum_marks
  		errors.add(:marks_obtained, "can't be more than maximum marks for this assessment (#{assessment.maximum_marks})")
  	end
  end
end
