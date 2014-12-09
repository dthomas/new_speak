class PersonalProfile < ActiveRecord::Base
	# Enum

	enum gender: [:female, :male]

	# Associations

  belongs_to :institute
  belongs_to :profileable, polymorphic: true

  # Validations

  validates :first_name, presence: true, length: { minimum: 2, maximum: 32 }
  validates :last_name, presence: true, length: { minimum: 2, maximum: 32 }
  validates :date_of_birth, presence: true
  validates :gender, presence: true
  validates :institute, presence: true

  # Nested Attributes
end
