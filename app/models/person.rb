class Person < ActiveRecord::Base
	# Password

	has_secure_password validations: false

	# Hstore Attributes

  store_accessor :profile, :date_of_admission, :admission_number, :occupation, :relation, :religion, :caste
	store_accessor :profile, :date_of_joining, :employee_number

	# Associations

  has_many :families, inverse_of: :person
  has_many :relatives, through: :families, foreign_key: "relative_id"
  has_many :reverse_families, class_name: "Family", inverse_of: :person, foreign_key: "relative_id"
  has_many :reverse_relatives, through: :reverse_families, source: :person
  has_many :teaching_assignments, foreign_key: :teacher_id

  belongs_to :institute

  # Enumerations

  enum gender: [:female, :male]
  enum role: [:student, :guardian, :teacher, :staff, :manager, :su]

  # Scopes

  # Validations

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :date_of_birth, presence: true
  validates :gender, presence: true
  validates :role, presence: true

  validates :institute, presence: true

  validates :date_of_admission, presence: true, if: :student?
  validates :admission_number, presence: true, if: :student?
  validates :date_of_joining, presence: true, if: (:teacher? || :staff? || :manager?)
  validates :employee_number, presence: true, if: (:teacher? || :staff?)

  validates :password, presence: true, length: { maximum: 72 }, confirmation: true, on: :create, if: "email.present?"

  # Nested Attributes

  accepts_nested_attributes_for :relatives
  accepts_nested_attributes_for :families

  # Instance Variables

  def name
  	"#{first_name} #{last_name}"
  end
end
