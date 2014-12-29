require 'rails_helper'

RSpec.describe Student, :type => :model do
  describe "associations" do
    it { should belong_to :institute }
    it { should belong_to :family }
    it { should have_one  :personal_profile }
    it { should have_many :parents }
    it { should have_many :siblings }
    it { should have_many :course_session_participants }
    it { should have_many :course_sessions }
    it { should have_many :courses }
    it { should have_many :class_group_students }
    it { should have_many :class_groups }
  end

  it { should validate_presence_of :date_of_admission }
  it { should validate_presence_of :admission_number }
  it { should validate_presence_of :institute }
end
