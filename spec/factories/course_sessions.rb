FactoryGirl.define do
  factory :course_session do
    sequence(:name) { |n| "Session-#{n}" }
		start_date { Date.today }
		end_date { start_date + 4.years }
		current_term nil
		course nil
		institute nil
  end

end
