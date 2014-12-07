class Family < ActiveRecord::Base
	# Associations

  belongs_to :parent
  belongs_to :student
  belongs_to :institute

  # Validations

  validates :name, presence: true
end
