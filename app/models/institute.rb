class Institute < ActiveRecord::Base
  # Associations
  belongs_to :owner, class_name: "User"
  has_many :users
  has_many :personal_profiles
  has_many :families
  has_many :courses, inverse_of: :institute
  has_many :course_sessions, inverse_of: :institute
  has_many :course_session_participants, inverse_of: :institute

  # Validations

  validates :name, presence: true
  validates :abbreviation, presence: true
  validates :subdomain, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 4, maximum: 20 }
  validates :phone, presence: true


  # Nested attributes

  accepts_nested_attributes_for :users
end
