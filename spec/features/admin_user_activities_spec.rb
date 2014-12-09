require 'rails_helper'

feature "Admin User Activities" do
	given(:institute) { FactoryGirl.create(:institute, custom_domain: "www.enchild.com") }
	given(:user) { FactoryGirl.create(:user, institute: institute) }
	given(:course) { FactoryGirl.create(:course, institute: institute) }
	given(:course_session) { FactoryGirl.create(:course_session, course: course, institute: institute) }
	
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

	scenario "list courses" do
		course
		perform_valid_sign_in
		visit dashboards_path
		click_link "Courses"

		expect(current_path).to eq courses_path
		expect(page).to have_content(course.name)
		expect(page).to have_content(course.abbreviation)
	end

	scenario "create a course and course_session" do
		perform_valid_sign_in
		visit dashboards_path
		click_link "Courses"
		click_link "New Course"

		course_attrs = FactoryGirl.attributes_for(:course)
		course_session_attrs = FactoryGirl.attributes_for(:course_session)

		fill_in "New Course Name", with: course_attrs[:name]
		fill_in "Course Abbreviation", with: course_attrs[:abbreviation]
		fill_in "Session Name", with: course_session_attrs[:name]
		fill_in "Session Start Date", with: course_session_attrs[:start_date]
		fill_in "Session End Date", with: course_session_attrs[:end_date]
		fill_in "Total Terms", with: course_session_attrs[:terms]
		fill_in "Current Term", with: course_session_attrs[:current_term]

		click_button "Add Course"
		expect(current_path).to eq courses_path
		expect(page).to have_content "New course #{course_attrs[:name]} created"
	end

	scenario "course details page" do
		perform_valid_sign_in
		course
		visit courses_path
		click_link "#{course.name}"
		expect(current_path).to eq course_path(course)
		expect(page).to have_content("#{course.name}")
		expect(page).to have_content("#{course.abbreviation}")
	end

	private

	def perform_valid_sign_in
		visit new_session_path

		fill_in "Email", with: user.email
		fill_in "Password", with: user.password

		click_button "Sign In"
	end

end