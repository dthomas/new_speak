require 'rails_helper'

feature "Teachers Admission" do
  given(:institute) { FactoryGirl.create(:institute, custom_domain: "www.enchild.com") }
  given(:user) { FactoryGirl.create(:user, institute: institute) }
  given(:teacher_profile) { FactoryGirl.attributes_for(:personal_profile) }

  background do
    Capybara.app_host = 'http://www.enchild.com'
  end

  scenario "new teacher" do
    perform_valid_sign_in
    visit dashboards_path
    click_link "Teachers"
    click_link "New Teacher"

    within("#teacher-info") do
      fill_in "First Name", with: teacher_profile[:first_name]
      fill_in "Last Name", with: teacher_profile[:last_name]
      fill_in "teacher[personal_profile_attributes][date_of_birth]", with: teacher_profile[:date_of_birth]
      select "Female"
    end

    click_button "Admit Teacher"
    expect(current_path).to eq teachers_path
    expect(body).to have_content("New teacher joined successfully")
  end

  private

  def perform_valid_sign_in
    visit new_session_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Sign In"
  end
end
