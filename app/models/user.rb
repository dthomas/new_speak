class User < ActiveRecord::Base
  # Associations

  belongs_to :institute

  # Validations
  validates :email, presence: true, uniqueness: { case_sensitive: false, scope: :institute_id }

  # Secure Password
  has_secure_password
end
