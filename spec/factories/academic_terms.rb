FactoryGirl.define do
  factory :academic_term do
    sequence(:title) { |n| "Term-#{n}" }
		sequence(:code) { |n| "T#{n}" }
		term_type 0
		course nil
		institute nil
  end

end
