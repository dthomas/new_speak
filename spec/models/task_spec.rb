require 'rails_helper'

RSpec.describe Task, :type => :model do
  describe "associations" do
    it { should belong_to :institute }
    it { should belong_to :assessment }
    it { should have_many :task_results }
  end

  describe "validations" do
    it { should validate_presence_of :institute }
    it { should validate_presence_of :assessment }
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :maximum_marks }
    it { should validate_presence_of :weightage }
    it { should validate_presence_of :due_date }
    it { should validate_numericality_of :maximum_marks }
    it { should validate_numericality_of(:weightage) }
  end
end
