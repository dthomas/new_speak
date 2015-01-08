FactoryGirl.define do
  factory :academic_term do
    sequence(:title) { |n| "Term-#{n}" }
		sequence(:code) { |n| "T#{n}" }
		term_type 0
		sequence(:term_class, 1) do |n|
			n < 13 ? n : n-4
		end
		course nil
		institute nil
  end

end
