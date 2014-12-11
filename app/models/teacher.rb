class Teacher < ActiveRecord::Base
	# Associations

  belongs_to 	:user
  belongs_to 	:institute
  has_one 		:personal_profile, as: :profileable

  # Validations

  # validates :institute, presence: true
  include VerifyInstitute
  validates :date_of_joining, presence: true
  validates :employee_number, presence: true

  # Nested Attributes
  accepts_nested_attributes_for :personal_profile

  # Delegations

  delegate  :first_name, :middle_name, :last_name, :gender, :date_of_birth,
            to: :personal_profile

  # Instance Methods
  def name
    "#{first_name} #{last_name}"
  end
end
