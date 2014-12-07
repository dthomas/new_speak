class Parent < ActiveRecord::Base
	# Associations

  belongs_to :person
  belongs_to :institute

  has_many :families
  has_many :students, through: :families

  # Validations

  validates :relation, presence: true
end
