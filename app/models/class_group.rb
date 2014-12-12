class ClassGroup < ActiveRecord::Base
	include VerifyInstitute

	# Associations

  belongs_to :course_session, inverse_of: :class_groups
  belongs_to :institute, inverse_of: :class_groups

  # Validations

  validates :name, presence: true, uniqueness: { case_sensistive: false, scope: [:course_session_id, :institute_id] }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :course_session, presence: true
  validates :institute, presence: true
end
