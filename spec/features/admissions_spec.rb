require "rails_helper"

feature "Student Admissions" do
	given(:institute) { FactoryGirl.create(:institute, custom_domain: "www.enchild.com") }
	given(:user) { FactoryGirl.create(:user, institute: institute) }
	given(:course) { FactoryGirl.create(:course, institute: institute) }
	given!(:course_session) { FactoryGirl.create(:course_session, course: course, institute: institute) }
	given(:family) { FactoryGirl.attributes_for(:family) }
	given(:studen) { FactoryGirl.attributes_for(:student) }
  given(:father) { FactoryGirl.attributes_for(:parent) }
  given(:mother) { FactoryGirl.attributes_for(:parent) }
  given(:student_profile) { FactoryGirl.attributes_for(:personal_profile) }
  given(:father_profile) { FactoryGirl.attributes_for(:personal_profile) }
  given(:mother_profile) { FactoryGirl.attributes_for(:personal_profile) }

	background do
	  Capybara.app_host = 'http://www.enchild.com'
	end

	scenario "new admission" do
		perform_valid_sign_in
		visit admissions_path
		click_link "New Admission"

    within("#student-info") do
      fill_in "First Name", with: student_profile[:first_name]
      fill_in "Middle Name", with: student_profile[:middle_name]
      fill_in "Last Name", with: student_profile[:last_name]
      fill_in "Date of Birth", with: student_profile[:date_of_birth]
      choose "Male"
    end

    within("#parent-0") do
      choose "Father"
      fill_in "First Name", with: father_profile[:first_name]
      fill_in "Middle Name", with: father_profile[:middle_name]
      fill_in "Last Name", with: father_profile[:last_name]
      fill_in "Date of Birth", with: father_profile[:date_of_birth]
      choose "Male"
    end

    within("#parent-1") do
      choose "Mother"
      fill_in "First Name", with: mother_profile[:first_name]
      fill_in "Middle Name", with: mother_profile[:middle_name]
      fill_in "Last Name", with: mother_profile[:last_name]
      fill_in "Date of Birth", with: mother_profile[:date_of_birth]
      choose "Female"
    end

    fill_in "Family Name", with: family[:name]
    click_button "Complete Admission"
    expect(current_path).to eq admissions_path
    expect(page).to have_content("Thank you.")

  end

	scenario "recent admissions" do

	end

	private

	def perform_valid_sign_in
		visit new_session_path

		fill_in "Email", with: user.email
		fill_in "Password", with: user.password

		click_button "Sign In"
	end
end
