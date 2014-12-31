FactoryGirl.define do
  factory :task do
    sequence(:name) { |n| "Task #{n}" }
		description "A small task part of a big assessment"
		maximum_marks "100"
		weightage "40"
		due_date { 5.days.from_today }
		assessment nil
		institute nil
  end

end
