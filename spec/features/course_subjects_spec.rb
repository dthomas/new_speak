require 'rails_helper'

feature "Course Subjects" do
	given(:institute) { FactoryGirl.create(:institute, custom_domain: "www.enchild.com") }
	given(:user) { FactoryGirl.create(:user, institute: institute) }
	given(:course) { FactoryGirl.create(:course, institute: institute) }
	given(:academic_term) { FactoryGirl.create(:academic_term, course: course, institute: institute) }
	given(:course_subject) { FactoryGirl.build(:course_subject, academic_term: academic_term, institute: institute) }

	background do
		Capybara.app_host = 'http://www.enchild.com'
	end

	scenario "create a subject in an existing course" do
		perform_valid_sign_in
		visit dashboards_path
		academic_term.save
		click_link "Courses"
		click_link course.name
		click_link academic_term.title
		click_link "[+ Subject]"

		fill_in "Subject Title", with: course_subject.title
		fill_in "Subject Code", with: course_subject.code
		fill_in "Teaching Hours", with: course_subject.teaching_hours

		click_button "Save Subject"
		expect(current_path).to eq academic_term_path(academic_term)
		expect(page).to have_content "New subject #{course_subject.title} created"
	end

	private

	def perform_valid_sign_in
		visit new_session_path

		fill_in "Email", with: user.email
		fill_in "Password", with: user.password

		click_button "Sign In"
	end
end