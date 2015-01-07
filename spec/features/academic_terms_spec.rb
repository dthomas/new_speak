require 'rails_helper'

feature "Courses" do
	given(:institute) { FactoryGirl.create(:institute, custom_domain: "www.enchild.com") }
	given(:user) { FactoryGirl.create(:person, role: :manager, institute: institute) }
	given(:course) { FactoryGirl.build(:course, institute: institute) }
	given(:academic_term) { FactoryGirl.build(:academic_term, course: course, institute: institute) }

	background do
		Capybara.app_host = 'http://www.enchild.com'
	end

	scenario "create a term in an existing course" do
		perform_valid_sign_in
		visit dashboards_path
		course.save
		click_link "Courses"
		click_link "[+ Term]"

		fill_in "Term Title", with: academic_term.title
		fill_in "Term Code", with: academic_term.code
		select "Year"
		select "10"

		click_button "Add Term"
		expect(current_path).to eq course_path(course)
		expect(page).to have_content "New term #{academic_term.title} created"
	end

	private

	def perform_valid_sign_in
		visit new_session_path

		fill_in "Email", with: user.email
		fill_in "Password", with: user.password

		click_button "Sign In"
	end
end