class Parent < ActiveRecord::Base
	# Associations

  belongs_to :institute
  belongs_to :family, inverse_of: :parents

  has_one :personal_profile, as: :profileable
  has_many :students, through: :family

  # Validations

  validates :institute, presence: true
  validates :relation, presence: true
  validates :occupation, presence: true

  # Nested Attributes
  accepts_nested_attributes_for :personal_profile

  # Delegations
  delegate  :first_name, :middle_name, :last_name, :date_of_birth, :gender,
            to: :personal_profile

  # Instance Methods
  def name
    "#{first_name} #{middle_name} #{last_name}"
  end
end
