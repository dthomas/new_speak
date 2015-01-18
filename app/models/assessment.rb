class Assessment < ActiveRecord::Base

  # Enum

  enum strategy: [:cumulative]
  enum assessment_type: [:academic, :behavioural]

	# Associations

  belongs_to  :tutorial
  belongs_to  :institute
  has_many    :tasks
  has_many    :assessment_results

  # Validations

  validates :title, presence: true
  validates :description, presence: true
  validates :due_date, presence: true
  validates :maximum_marks, presence: true
  validates :strategy, presence: true
  validates :assessment_type, presence: true
  validates :tutorial, presence: true
  validates :institute, presence: true

  # Delegations

  delegate :term_class, to: :tutorial
end
