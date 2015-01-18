class Institute < ActiveRecord::Base
  # Associations
  belongs_to :owner, class_name: "Person"
  # has_many :families
  has_many :people
  has_many :courses, inverse_of: :institute
  has_many :course_sessions, inverse_of: :institute
  has_many :course_session_participants, inverse_of: :institute
  has_many :class_groups, inverse_of: :institute
  has_many :course_subjects, inverse_of: :institute
  has_many :academic_terms, inverse_of: :institute
  has_many :tutorials, inverse_of: :institute
  has_many :assessments, inverse_of: :institute
  has_many :assessment_results, inverse_of: :institute
  has_many :tasks, inverse_of: :institute
  has_many :task_results, inverse_of: :institute

  # Validations

  validates :name, presence: true
  validates :abbreviation, presence: true
  validates :subdomain, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 4, maximum: 20 }
  validates :phone, presence: true


  # Nested attributes

  accepts_nested_attributes_for :people
end
