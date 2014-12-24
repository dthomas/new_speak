require 'rails_helper'

RSpec.describe TeachingAssignment, :type => :model do
  describe "associations" do
    it { should belong_to :institute }
    it { should belong_to :class_group }
    it { should belong_to :teacher }
    it { should belong_to :course_subject }
  end

  describe "validations" do
    it { should validate_presence_of :institute }
    it { should validate_presence_of :class_group }
    it { should validate_presence_of :teacher }
    it { should validate_presence_of :course_subject }
    # it "should ensure unique teacher student mapping for a subject" do
    #   institute = FactoryGirl.create(:institute)
    #   teacher = FactoryGirl.create(:teacher, institute: institute)
    #   course = FactoryGirl.create(:course, institute: institute)
    #   term = FactoryGirl.create(:academic_term, course: course, institute: institute)
    #   session = FactoryGirl.create(:course_session, course: course, current_term: term, institute: institute)
    #   class_group = FactoryGirl.create(:class_group, course_session: session, institute: institute)
    #   course_subject = FactoryGirl.create(:course_subject, academic_term: term, institute: institute)
    #   should validate_uniqueness_of(:teacher_id)#.scoped_to([:class_group_id, :course_subject_id, :institute_id])
    # end
  end
end
