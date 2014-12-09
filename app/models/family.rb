class Family < ActiveRecord::Base
	# Associations

  has_many :parents
  has_many :students
  belongs_to :institute

  # Validations

  validates :name, presence: true
  validates :institute, presence: true

  # Nested Attributes

  accepts_nested_attributes_for :parents
  accepts_nested_attributes_for :students
end
