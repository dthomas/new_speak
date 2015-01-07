class Family < ActiveRecord::Base
	# Associations

  # has_many :parents, inverse_of: :family
  # has_many :students, inverse_of: :family
  # has_many :teachers, inverse_of: :family
  # has_many :people, inverse_of: :family

  belongs_to :person, inverse_of: :families
  belongs_to :relative, class_name: "Person", inverse_of: :families

  # Validations

  validates :person, presence: true
  validates :relative, presence: true
  # validate :self_is_not_relative

  def self_is_not_relative
    if person && relative && (person.id == relative.id)
      errors.add(:person, "can't be relative of self")
    end
  end

  # Nested Attributes

  # accepts_nested_attributes_for :parents
  # accepts_nested_attributes_for :students
end
