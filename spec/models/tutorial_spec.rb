require 'rails_helper'

RSpec.describe Tutorial, :type => :model do
  describe "associations" do
    it { should belong_to :institute }
    it { should belong_to :class_group }
    it { should belong_to :teacher }
    it { should belong_to :course_subject }
    it { should have_many :assessments }
  end

  describe "validations" do
    it { should validate_presence_of :institute }
    it { should validate_presence_of :class_group }
    it { should validate_presence_of :teacher }
    it { should validate_presence_of :course_subject }
  end
end
