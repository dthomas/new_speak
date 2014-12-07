FactoryGirl.define do
  factory :course do
    sequence(:name) { |n| "Course-#{n}" }
		sequence(:abbreviation) { |n| "CRS-#{n}" }
		institute nil
  end
end
