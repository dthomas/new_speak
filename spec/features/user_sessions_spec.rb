require 'rails_helper'

feature "User Sessions" do
	given(:institute) { FactoryGirl.create(:institute, custom_domain: "www.enchild.com") }
	given(:user) { FactoryGirl.create(:user, institute: institute) }
	
	background do
		Capybara.app_host = 'http://www.enchild.com'
	end

	scenario "sign in with valid params" do
		perform_valid_sign_in
		expect(current_path).to eq dashboards_path
		expect(page).to have_content "Signed In"
	end

	scenario "sign in with invalid params" do
		visit new_session_path

		fill_in "Email", with: user.email
		fill_in "Password", with: "invalid-password"

		click_button "Sign In"
		expect(page).to have_content "Invalid email or password"
	end

	scenario "sign out of the account" do
		perform_valid_sign_in
		click_link "Sign out"
		expect(current_path).to eq new_session_path
		expect(page).to have_content("You have been signed out")
	end

	private

	def perform_valid_sign_in
		visit new_session_path

		fill_in "Email", with: user.email
		fill_in "Password", with: user.password

		click_button "Sign In"
	end

end