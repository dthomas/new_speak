class Task < ActiveRecord::Base
	# Assocations

  belongs_to  :assessment
  belongs_to  :institute
  has_many    :task_results

  # Validations

  validates :assessment, presence: true
  validates :institute, presence: true
  
  validates :name, presence: true, uniqueness: { case_sensitive: false, scope: :assessment_id }
  validates :due_date, presence: true
  validates :description, presence: true
  validates :maximum_marks, presence: true, numericality: true
  validates :weightage, presence: true, numericality: { minimum: 0, maximum: 100 }
  validate  :ensure_total_tasks_marks_does_not_exceed_assessment_marks

  # Nested Attributes

  accepts_nested_attributes_for :task_results


  # Instance Methods
  def ensure_total_tasks_marks_does_not_exceed_assessment_marks
    other_tasks = assessment.tasks if assessment
    total_marks = 0
    other_tasks.try(:each) do |task|
      if task.id == self.id
        total_marks += maximum_marks * (weightage / 100)
      else
        total_marks += task.maximum_marks * (task.weightage / 100)
      end
    end

    if assessment && (total_marks > assessment.maximum_marks)
      errors.add(:maximum_marks, "sum of all marks of tasks (#{total_marks}) should be less than maximum marks (#{assessment.maximum_marks}).")
    end        
  end
end
