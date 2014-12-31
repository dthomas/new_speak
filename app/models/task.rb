class Task < ActiveRecord::Base
	# Assocations

  belongs_to  :assessment
  belongs_to  :institute
  has_many    :task_results

  # Validations

  validates :assessment, presence: true
  validates :institute, presence: true
  
  validates :name, presence: true, uniqueness: { case_sensitive: false, scope: :institute_id }
  validates :due_date, presence: true
  validates :description, presence: true
  validates :maximum_marks, presence: true, numericality: true
  validates :weightage, presence: true, numericality: { minimum: 0, maximum: 100 }

  # Nested Attributes

  accepts_nested_attributes_for :task_results
end
