require 'rails_helper'

RSpec.describe TaskResult, :type => :model do
  describe "associations" do
    it { should belong_to :student }
    it { should belong_to :task }
    it { should belong_to :assessment_result }
    it { should belong_to :institute }
  end

  describe "validations" do
    it { should validate_presence_of :student }
    # it { should validate_presence_of :task }
    it { should validate_presence_of :assessment_result }
    it { should validate_presence_of :institute }
    it { should validate_presence_of :marks_obtained }
    it { should validate_numericality_of :marks_obtained }
  end
end
