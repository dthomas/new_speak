FactoryGirl.define do
  factory :academic_term do
    sequence(:title) { |n| "Term-#{n}" }
		sequence(:code) { |n| "T#{n}" }
		term_type 0
		sequence(:term_class) { |n| n }
		course nil
		institute nil
  end

end
