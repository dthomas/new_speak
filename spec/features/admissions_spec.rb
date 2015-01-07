require "rails_helper"

feature "Student Admissions" do
  given(:institute) { FactoryGirl.create(:institute, custom_domain: "www.enchild.com") }
  given(:user) { FactoryGirl.create(:person, role: :manager, institute: institute) }
  given(:course) { FactoryGirl.create(:course, institute: institute) }
  given(:academic_terms) { FactoryGirl.create_list(:academic_term, 2, course: course, institute: institute) }
  given!(:course_session) { FactoryGirl.create(:course_session, course: course, current_term: academic_terms[0], institute: institute) }
  given(:student) { FactoryGirl.build(:person) }
  given(:father) { FactoryGirl.build(:person, role: :guardian) }
  given(:mother) { FactoryGirl.build(:person, role: :guardian) }

  background do
    Capybara.app_host = 'http://www.enchild.com'
  end

  scenario "new admission" do
    perform_valid_sign_in
    click_link "Admissions"
    click_link "Open"

    fill_in "student[first_name]", with: student.first_name
    fill_in "student[middle_name]", with: student.middle_name
    fill_in "student[last_name]", with: student.last_name
    fill_in "student[date_of_birth]", with: student.date_of_birth
    fill_in "student[date_of_admission]", with: Date.today
    select "Male", from: "student[gender]"

    fill_in "student[relatives_attributes][0][first_name]", with: father.first_name
    fill_in "student[relatives_attributes][0][middle_name]", with: father.middle_name
    fill_in "student[relatives_attributes][0][last_name]", with: father.last_name
    fill_in "student[relatives_attributes][0][date_of_birth]", with: father.date_of_birth
    fill_in "student[relatives_attributes][0][occupation]", with: "Business"
    select "Male", from: "student[relatives_attributes][0][gender]"
    select "Father", from: "student[relatives_attributes][0][relation]"

    fill_in "student[relatives_attributes][1][first_name]", with: mother.first_name
    fill_in "student[relatives_attributes][1][middle_name]", with: mother.middle_name
    fill_in "student[relatives_attributes][1][last_name]", with: mother.last_name
    fill_in "student[relatives_attributes][1][date_of_birth]", with: mother.date_of_birth
    fill_in "student[relatives_attributes][1][occupation]", with: "Home Maker"
    select "Female", from: "student[relatives_attributes][1][gender]"
    select "Mother", from: "student[relatives_attributes][1][relation]"

    click_button "Complete Admission"
    # binding.pry
    expect(current_path).to eq course_session_path(course_session)
    expect(page).to have_content("Admission for #{student.first_name}")

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
