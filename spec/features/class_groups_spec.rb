require 'rails_helper'

feature "Class Groups" do
  given(:institute) { FactoryGirl.create(:institute, custom_domain: "www.enchild.com") }
  given(:user) { FactoryGirl.create(:person, role: :manager, institute: institute) }
	given(:course) { FactoryGirl.create(:course, institute: institute) }
 	given(:academic_terms) { FactoryGirl.create_list(:academic_term, 2, course: course, institute: institute) }
	given!(:course_session) { FactoryGirl.create(:course_session, course: course, current_term: academic_terms[0], institute: institute) }
	given(:father) { FactoryGirl.create(:person, role: :guardian, institute: institute) }
	given(:mother) { FactoryGirl.create(:person, role: :guardian, institute: institute) }
	given(:student1) { FactoryGirl.create(:person, role: :student, institute: institute ) }
	given(:student2) { FactoryGirl.create(:person, role: :student, institute: institute ) }
	given(:student3) { FactoryGirl.create(:person, role: :student, institute: institute ) }
	given(:student4) { FactoryGirl.create(:person, role: :student, institute: institute ) }
	given!(:teacher) { FactoryGirl.create(:person, role: :teacher ,institute: institute) }
	given!(:participant1) { FactoryGirl.create(:course_session_participant, course_session: course_session, student: student1, institute: institute) }
	given!(:participant2) { FactoryGirl.create(:course_session_participant, course_session: course_session, student: student2, institute: institute) }
	given!(:participant3) { FactoryGirl.create(:course_session_participant, course_session: course_session, student: student3, institute: institute) }
	given!(:participant4) { FactoryGirl.create(:course_session_participant, course_session: course_session, student: student4, institute: institute) }
	given(:class_group) { FactoryGirl.attributes_for(:class_group) }

  background do
    Capybara.app_host = 'http://www.enchild.com'
  end

	scenario "new class_group with some students" do
		perform_valid_sign_in
		click_link "Courses"
		click_link "#{course.name}"
		click_link "+"
		fill_in "Group Name", with: class_group[:name]
		select teacher.name
		fill_in "Start date", with: class_group[:start_date]
		fill_in "End date", with: class_group[:end_date]
		[0,2,3].each do |n|
			check "student-#{n}"
		end

		click_button "Add Class Group"
		expect(current_path).to eq class_group_path(course_session.class_groups.last)
		expect(body).to have_content("New Class Group Created Successfully")
	end

	private

	def perform_valid_sign_in
		visit new_session_path

		fill_in "Email", with: user.email
		fill_in "Password", with: user.password

		click_button "Sign In"
	end
end