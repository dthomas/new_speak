FactoryGirl.define do
  factory :person do
    sequence(:first_name) { |n| "First #{n}" }
    sequence(:middle_name) { |n| "Middle #{n}" }
    sequence(:last_name) { |n| "Last #{n}" }
		gender 0
		role 0
		profile {}
		date_of_birth { Date.today - 6.years }
		date_of_admission { Date.today }
		date_of_joining { Date.today }
    sequence(:admission_number) { |n| n }
    sequence(:employee_number) { |n| n }
		sequence(:email) { |n| "user#{n}@example.com" }
		password "sekret"
		password_confirmation { password }
		institute nil
  end

end
