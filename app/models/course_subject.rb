class CourseSubject < ActiveRecord::Base
	# Associations

  belongs_to :academic_term
  belongs_to :institute

  # Validations

  validates :academic_term, presence: true
  validates :institute, presence: true
  validates :title, presence: true, uniqueness: { case_sensitive: false, scope: [:academic_term_id, :institute_id]}
  validates :code, presence: true, uniqueness: { case_sensitive: false, scope: [:academic_term_id, :institute_id]}
  validates :teaching_hours, presence: true, numericality: { minimum: 1 }

  # Scopes

  scope :currently_active, -> { where(active: true) }
end
