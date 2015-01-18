class Tutorial < ActiveRecord::Base
	# Associations

  belongs_to :course_subject, inverse_of: :tutorials
  belongs_to :teacher, class_name: "Person"
  belongs_to :class_group, inverse_of: :tutorials
  belongs_to :institute, inverse_of: :tutorials

  has_many :assessments

  # Validations

  validates :course_subject, presence: true
  validates :teacher, presence: true, uniqueness: { scope: [:course_subject_id, :class_group_id, :institute_id] }
  validates :class_group, presence: true
  validates :institute, presence: true

  # Delegations

  delegate :term_class, to: :class_group
end
