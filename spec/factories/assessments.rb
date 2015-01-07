FactoryGirl.define do
  factory :assessment do
    sequence(:title) { |n| "Assessment #{n}" }
		description "Big description of the assessment"
		weightage 30
		maximum_marks 100
		strategy :cumulative
		due_date { Date.today + 14.days }
		teaching_assignment nil
		institute nil
  end

end
