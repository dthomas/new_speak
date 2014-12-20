FactoryGirl.define do
  factory :student do
    date_of_admission "2014-12-06"
		date_of_leaving "2014-12-06"
		sequence(:admission_number) { |n| n }
		family nil
		institute nil

		after(:build) do |student|
			student.personal_profile = build(:personal_profile, profileable: student, institute: student.institute)
		end

		after(:create) do |student|
			student.personal_profile.save!
		end
  end

end
