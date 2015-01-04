require 'rails_helper'

RSpec.describe ClassGroup, :type => :model do
  describe "associations" do
    it { should belong_to :class_teacher }
    it { should belong_to :course_session }
    it { should belong_to :institute }

    it { should have_many :class_group_students }
    it { should have_many :students }
    it { should have_many :teaching_assignments }
    it { should have_many :course_subjects }
    it { should have_many :teachers }
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :start_date }
    it { should validate_presence_of :end_date }
    it { should validate_presence_of :term_class }
    it { should validate_presence_of :class_teacher }
    it { should validate_presence_of :course_session }
    it { should validate_presence_of :institute }
  end
end
