require 'rails_helper'

RSpec.describe Teacher, :type => :model do
  describe "associations" do
    # it { should belong_to :institute }

    # it { should have_one :personal_profile }
    # it { should have_many :teaching_assignments }
    # it { should have_many :course_subjects }
    # it { should have_many :class_groups }
    # it { should have_many :in_charge_classes }
  end

  describe "validations" do
    it { should validate_presence_of :institute }
    it { should validate_presence_of :date_of_joining }
    it { should validate_presence_of :employee_number }
  end
end
