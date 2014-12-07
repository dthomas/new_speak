class Person < ActiveRecord::Base
	# Enum

	enum gender: [:female, :male]

	# Associations

  belongs_to :person_type
  belongs_to :institute
  has_one :student
  has_one :parent
  has_one :teacher

  # Validations

  validates :first_name, presence: true, length: { minimum: 2, maximum: 32 }
  validates :last_name, presence: true, length: { minimum: 2, maximum: 32 }
  validates :date_of_birth, presence: true
  validates :gender, presence: true
  validates :person_type, presence: true

  # Nested Attributes

  accepts_nested_attributes_for :student
  accepts_nested_attributes_for :teacher
  accepts_nested_attributes_for :parent
end
