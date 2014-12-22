FactoryGirl.define do
  factory :course_subject do
    sequence(:title) { |n| "Subject Name #{n}" }
		sequence(:code) { |n| "SB-#{n}" }
		teaching_hours 120
		academic_term nil
		institute nil
  end

end
