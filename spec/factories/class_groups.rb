FactoryGirl.define do
  factory :class_group do
    sequence(:name) { |n| "#{n}-A" }
    start_date { 8.months.ago }
    end_date { 4.months.from_now }
		institute nil
		course_session nil
		class_teacher nil
  end

end
