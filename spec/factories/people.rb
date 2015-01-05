FactoryGirl.define do
  factory :person do
    sequence(:first_name) { |n| "First #{n}" }
    sequence(:middle_name) { |n| "Middle #{n}" }
    sequence(:last_name) { |n| "Last #{n}" }
		gender 0
		person_type 0
		date_of_birth { Date.today }
		profile {}
		sequence(:email) { |n| "user#{n}@example.com" }
		family nil
		institute nil
  end

end
