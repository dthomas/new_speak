require 'rails_helper'

feature "Courses" do
	given(:institute) { FactoryGirl.create(:institute, custom_domain: "www.enchild.com") }
	given(:user) { FactoryGirl.create(:person, role: :manager, institute: institute) }
	given(:course) { FactoryGirl.build(:course, institute: institute) }
	given(:academic_terms) { FactoryGirl.build_list(:academic_term, 2, course: course, institute: institute) }
	given(:course_session) { FactoryGirl.create(:course_session, course: course, institute: institute) }

	background do
		Capybara.app_host = 'http://www.enchild.com'
	end

	scenario "list courses" do
		course.save
		perform_valid_sign_in
		visit dashboards_path
		click_link "Courses"

		expect(current_path).to eq courses_path
		expect(page).to have_content(course.name)
	end

	scenario "create a course and course_session" do
		perform_valid_sign_in
		visit dashboards_path
		click_link "Courses"
		click_link "New Course"

		fill_in "New Course Name", with: course.name
		fill_in "Course Abbreviation", with: course.abbreviation
		[1,2].each do |term|
			within("#term-#{term}") do
				fill_in "Term Title", with: academic_terms[term-1][:title]
				fill_in "Term Code", with: academic_terms[term-1][:code]
				select "Year"
				select academic_terms[term-1][:term_class]
			end
		end

		click_button "Add Course"
		expect(current_path).to eq courses_path
		expect(page).to have_content "New course #{course.name} created"
	end

	scenario "course details page" do
		perform_valid_sign_in
		course.save
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