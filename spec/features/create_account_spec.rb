require 'rails_helper'

feature "Account sign up" do

	given(:institute) { FactoryGirl.attributes_for(:institute) }
	given(:user) { FactoryGirl.attributes_for(:user) }

	background do
		Capybara.app_host = 'http://www.newspeak.com'
	end

	scenario "with valid params" do
		visit new_account_path
		within("#sign-up-form") do
			fill_in "Institute Name", with: institute[:name]
			fill_in "Name Abbreviation", with: institute[:abbreviation]
			fill_in "Subdomain", with: institute[:subdomain]
			fill_in "Phone Number", with: institute[:phone]

			fill_in "Email Address", with: user[:email]
			fill_in "Password", with: user[:password]
			fill_in "Confirmation Password", with: user[:password_confirmation]
		end

		click_button "Create Account"
		expect(current_path).to eq new_session_path
		expect(page).to have_content("Account created successfully! Please check your email.")
	end

	scenario "with invalid params", pending: true do
		visit new_account_path
		within "#sign-up-form" do
			fill_in "Institute Name", with: institute[:name]
			fill_in "Name Abbreviation", with: institute[:abbreviation]
			fill_in "Subdomain", with: institute[:subdomain]
			fill_in "Email Address", with: user[:email]

			expect(page).to have_content("can't be blank")
		end
	end
end