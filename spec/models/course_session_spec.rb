require 'rails_helper'

RSpec.describe CourseSession, :type => :model do
  describe "associations" do
    it { should belong_to :institute }
    it { should belong_to :course }

    it { should have_many :course_session_participants }
    it { should have_many :students }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:end_date) }
    it { should validate_presence_of(:terms) }
    it { should validate_presence_of(:current_term) }
    it { should validate_presence_of(:course) }
    it { should validate_presence_of(:institute) }

    it { should validate_numericality_of(:terms) }
    it { should validate_numericality_of(:current_term) }

    it "should validate case insensitive uniqueness of :name" do
    	institute = FactoryGirl.create(:institute)
    	course = FactoryGirl.create(:course, institute: institute)
    	FactoryGirl.create(:course_session, course: course, institute: institute)
    	should validate_uniqueness_of(:name).case_insensitive.scoped_to([:course_id, :institute_id])
    end
  end
end
