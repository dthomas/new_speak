require 'rails_helper'

feature "Assessments Tasks & Results" do
  given(:institute) { FactoryGirl.create(:institute, custom_domain: "www.enchild.com") }
  given(:user) { FactoryGirl.create(:person, role: :teacher, institute: institute) }
	given(:course) { FactoryGirl.create(:course, institute: institute) }
 	given(:academic_terms) { FactoryGirl.create_list(:academic_term, 2, course: course, institute: institute) }
 	given(:course_subject) { FactoryGirl.create(:course_subject, academic_term: academic_terms[0], institute: institute) }
	given(:course_session) { FactoryGirl.create(:course_session, course: course, current_term: academic_terms[0], institute: institute) }
	given(:student) { FactoryGirl.create(:person, institute: institute ) }
	given(:teacher) { user }
	given(:participant) { FactoryGirl.create(:course_session_participant, course_session: course_session, student: student, institute: institute) }
	given(:class_group) { FactoryGirl.create(:class_group, class_teacher: teacher, course_session: course_session, term_class: academic_terms[0].term_class, institute: institute) }
	given(:student_class) { FactoryGirl.create(:class_group_student, student: student, class_group: class_group, institute: institute) }
	given!(:tutorial) { FactoryGirl.create(:tutorial, course_subject: course_subject, teacher: teacher, class_group: class_group, institute: institute) }
	given(:assessment) { FactoryGirl.build(:assessment, tutorial: tutorial ,institute: institute) }
	given(:assessment_result) { FactoryGirl.create(:assessment_result, student: student, assessment: assessment, institute: institute) }
	given(:task) { FactoryGirl.build(:task, weightage: 100, assessment: assessment, institute: institute) }
  given(:task_result) { FactoryGirl.build(:task_result, assessment_result: assessment_result, student: student, task: task, institute: institute) }

  background do
    Capybara.app_host = 'http://www.enchild.com'
  end

  scenario "new assessment" do
  	perform_valid_sign_in
  	click_link "#{course_subject.title}"
  	click_link "[+Assessment]"
  	fill_in "assessment[title]", with: assessment.title
  	fill_in "assessment[due_date]", with: assessment.due_date
  	fill_in "assessment[description]", with: assessment.description
  	fill_in "assessment[weightage]", with: assessment.weightage
  	fill_in "assessment[maximum_marks]", with: assessment.maximum_marks
    select "Cumulative", from: "assessment[strategy]"
  	select "Academic", from: "assessment[assessment_type]"
  	click_button "Save Assessment"
  	expect(current_path).to eq tutorial_path(tutorial)
  	expect(page).to have_content "Assessment has been created successfully"
  end

  scenario "new task" do
  	perform_valid_sign_in
  	assessment.save
  	click_link "#{course_subject.title}"
  	click_link "#{assessment.title}"
  	click_link "New Task"
  	fill_in "task[name]", with: task.name
  	fill_in "task[due_date]", with: task.due_date
  	fill_in "task[description]", with: task.description
  	fill_in "task[maximum_marks]", with: task.maximum_marks
  	fill_in "task[weightage]", with: task.weightage

  	click_button "Save Task"
  	expect(current_path).to eq assessment_path(assessment)
  	expect(page).to have_content "#{task.name} was added to the assessment"
  end

  scenario "task result and grading" do
    perform_valid_sign_in
    task.save
    task_result.save
    click_link "#{course_subject.title}"
    click_link "#{assessment.title}"
    click_link "#{task.name}"
    click_link "Update Marks"
    fill_in "task[task_results_attributes][0][marks_obtained]", with: "92"
    click_button "Update Marks"
    expect(current_path).to eq task_path(task)
    click_link "#{assessment.title}"
    click_link "Grade Assessment"
    expect(body).to match /(A\+|A1)/
  end

	private

	def perform_valid_sign_in
		visit new_session_path

		fill_in "Email", with: user.email
		fill_in "Password", with: user.password

		click_button "Sign In"
	end
end