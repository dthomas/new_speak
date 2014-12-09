FactoryGirl.define do
  factory :personal_profile do
    sequence(:first_name) { |n| "Kiran#{n}" }
		middle_name "Raja"
		last_name "Madhav"
		date_of_birth "2014-12-06"
		gender 1
		institute nil
  end

end
