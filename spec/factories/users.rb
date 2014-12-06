FactoryGirl.define do
  factory :user do
    email "manager@example.com"
		password "1234"
		password_confirmation { password }
		institute nil
  end

end
