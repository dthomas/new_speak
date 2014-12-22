require 'rails_helper'

RSpec.describe AcademicTerm, :type => :model do
  let(:institute) { FactoryGirl.create(:institute, custom_domain: "www.enchild.com") }
  let(:course) { FactoryGirl.build(:course, institute: institute) }
  
  describe "associations" do
    it { should belong_to :course }
    it { should belong_to :institute }
    # it { should have_many :course_sessions }
    it { should have_many :course_subjects }
  end

  describe "validations" do
    it { should validate_presence_of :course }
    it { should validate_presence_of :institute }
    it { should validate_presence_of :title }
    it { should validate_presence_of :code }
    it "validate uniquness of title and code scoped to the course" do
      FactoryGirl.create(:academic_term, course: course, institute: institute)
      should validate_uniqueness_of(:title).case_insensitive.scoped_to([:course_id, :institute_id])
      should validate_uniqueness_of(:code).case_insensitive.scoped_to([:course_id, :institute_id])
    end
  end
end
