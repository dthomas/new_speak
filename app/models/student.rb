class Student < ActiveRecord::Base
	# Associations

  belongs_to :user
  belongs_to :person
  belongs_to :institute

  has_many :families
  has_many :parents, through: :families
  has_many :siblings, through: :families, source: :student

  # Validations

  validates :person, presence: true
  validates :institute, presence: true

  validates :date_of_admission, presence: true
  validates :admission_number, presence: true

  # Nested attributes
  accepts_nested_attributes_for :families
  accepts_nested_attributes_for :parents
end
