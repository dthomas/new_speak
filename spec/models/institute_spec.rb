require 'rails_helper'

RSpec.describe Institute, :type => :model do
  describe "associations" do
    it { should belong_to :owner }
    it { should have_many :courses }
    # it { should have_many :families }
    it { should have_many :course_sessions }
    it { should have_many :course_session_participants }
    it { should have_many :class_groups }
    it { should have_many :course_subjects }
    it { should have_many :academic_terms }
    it { should have_many :tutorials }
    it { should have_many :assessments }
    it { should have_many :assessment_results }
    it { should have_many :tasks }
    it { should have_many :task_results }
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :abbreviation }
    it { should validate_presence_of :subdomain }
    it { should validate_presence_of :phone }
  end
end
