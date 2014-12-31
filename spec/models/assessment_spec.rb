require 'rails_helper'

RSpec.describe Assessment, :type => :model do
  describe "associations" do
    it { should belong_to :teaching_assignment }
    it { should belong_to :institute }
    it { should have_many :tasks }
    it { should have_many :assessment_results }
  end

  describe "validations" do
  	it { should validate_presence_of :title }
  	it { should validate_presence_of :description }
  	it { should validate_presence_of :maximum_marks }
  	it { should validate_presence_of :strategy }
    it { should validate_presence_of :due_date }
    it { should validate_presence_of :teaching_assignment }
    it { should validate_presence_of :institute }
  end
end
