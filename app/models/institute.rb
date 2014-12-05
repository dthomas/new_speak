class Institute < ActiveRecord::Base
  # Associations
  belongs_to :owner, class_name: "User"
  has_many :users

  # Validations

  validates :name, presence: true
  validates :abbreviation, presence: true
  validates :subdomain, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 4, maximum: 20 }
  validates :phone, presence: true


  # Nested attributes

  accepts_nested_attributes_for :users
end
