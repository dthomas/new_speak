class Person < ActiveRecord::Base
	# Password

	has_secure_password validations: false

	# Hstore Attributes

	store_accessor :profile, :date_of_admission, :admission_number, :employee_number

	# Associations

  belongs_to :family
  belongs_to :institute

  # Enumerations

  enum gender: [:female, :male]
  enum person_type: [:student, :guardian, :teacher, :staff, :manager, :su]

  # Scopes

  # Validations

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :date_of_birth, presence: true
  validates :gender, presence: true
  validates :person_type, presence: true

  validates :family, presence: true
  validates :institute, presence: true

  validates :date_of_admission, presence: true, if: :student?
  validates :admission_number, presence: true, if: :student?
  validates :date_of_joining, presence: true, if: (:teacher? || :staff? || :manager?)
  validates :employee_number, presence: true, if: (:teacher? || :staff?)

  validates :password, presence: true, length: { maximum: 72 }, confirmation: true, if: "email.present?"

  # Instance Variables

  def name
  	"#{first_name} #{last_name}"
  end
end
