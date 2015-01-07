require 'rails_helper'

feature "Teachers Admission" do
  given(:institute) { FactoryGirl.create(:institute, custom_domain: "www.enchild.com") }
  given(:user) { FactoryGirl.create(:person, role: :manager, institute: institute) }
  given(:teacher) { FactoryGirl.build(:person, role: :teacher) }
  given(:father) { FactoryGirl.build(:person, role: :guardian) }
  given(:mother) { FactoryGirl.build(:person, role: :guardian) }

  background do
    Capybara.app_host = 'http://www.enchild.com'
  end

  scenario "new teacher" do
    perform_valid_sign_in
    visit dashboards_path
    click_link "Teachers"
    click_link "New Teacher"

    fill_in "teacher[first_name]", with: teacher.first_name
    fill_in "teacher[middle_name]", with: teacher.middle_name
    fill_in "teacher[last_name]", with: teacher.last_name
    fill_in "teacher[date_of_birth]", with: teacher.date_of_birth
    fill_in "teacher[date_of_joining]", with: Date.today
    select "Female", from: "teacher[gender]"

    fill_in "teacher[relatives_attributes][0][first_name]", with: father.first_name
    fill_in "teacher[relatives_attributes][0][middle_name]", with: father.middle_name
    fill_in "teacher[relatives_attributes][0][last_name]", with: father.last_name
    fill_in "teacher[relatives_attributes][0][date_of_birth]", with: father.date_of_birth
    fill_in "teacher[relatives_attributes][0][occupation]", with: "Business"
    select "Male", from: "teacher[relatives_attributes][0][gender]"
    select "Father", from: "teacher[relatives_attributes][0][relation]"

    fill_in "teacher[relatives_attributes][1][first_name]", with: mother.first_name
    fill_in "teacher[relatives_attributes][1][middle_name]", with: mother.middle_name
    fill_in "teacher[relatives_attributes][1][last_name]", with: mother.last_name
    fill_in "teacher[relatives_attributes][1][date_of_birth]", with: mother.date_of_birth
    fill_in "teacher[relatives_attributes][1][occupation]", with: "Home Maker"
    select "Female", from: "teacher[relatives_attributes][1][gender]"
    select "Mother", from: "teacher[relatives_attributes][1][relation]"


    click_button "Complete Joining"
    expect(current_path).to eq teachers_path
    expect(body).to have_content("Joining for #{teacher.name}")
  end

  private

  def perform_valid_sign_in
    visit new_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Sign In"
  end
end
