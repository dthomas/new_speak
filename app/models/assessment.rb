class Assessment < ActiveRecord::Base

  # Enum

  enum strategy: [:cumulative, :best, :best_of_n, :mean]

	# Associations

  belongs_to  :teaching_assignment
  belongs_to  :institute
  has_many    :tasks
  has_many    :assessment_results

  # Validations

  validates :title, presence: true
  validates :description, presence: true
  validates :due_date, presence: true
  validates :maximum_marks, presence: true
  validates :strategy, presence: true
  validates :teaching_assignment, presence: true
  validates :institute, presence: true

  # Delegations

  delegate :term_class, to: :teaching_assignment
end
