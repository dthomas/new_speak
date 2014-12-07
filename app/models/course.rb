class Course < ActiveRecord::Base
	# Associations

  belongs_to :institute

  # Validations

  validates :institute, presence: true
  validates :name, presence: true, uniqueness: { case_sensitive: false, scope: :institute_id }
  validates :abbreviation, presence: true, uniqueness: { case_sensitive: false, scope: :institute_id }
end
