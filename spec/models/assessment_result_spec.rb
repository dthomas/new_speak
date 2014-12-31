require 'rails_helper'

RSpec.describe AssessmentResult, :type => :model do
  describe "associations" do
    it { should belong_to :student }
    it { should belong_to :assessment }
    it { should belong_to :institute }
    it { should have_many :task_results }
  end

  describe "validations" do
    it { should validate_presence_of :student }
    it { should validate_presence_of :assessment }
    it { should validate_presence_of :institute }
    it { should validate_presence_of :marks_obtained }
    it { should validate_numericality_of :marks_obtained }
  end
end
