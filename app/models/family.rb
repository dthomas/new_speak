class Family < ActiveRecord::Base
	# Associations

  has_many :parents, inverse_of: :family
  has_many :students, inverse_of: :family
  has_many :teachers, inverse_of: :family
  belongs_to :institute

  # Validations

  validates :name, presence: true
  validates :institute, presence: true

  # Nested Attributes

  accepts_nested_attributes_for :parents
  accepts_nested_attributes_for :students
end
