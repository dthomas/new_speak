require 'rails_helper'

RSpec.describe CourseSubject, :type => :model do
  describe "associations" do
    it { should belong_to :academic_term }
    it { should belong_to :institute }
  end

  describe "validations" do
    it { should validate_presence_of :academic_term }
    it { should validate_presence_of :institute }
    it { should validate_presence_of :title }
    it { should validate_presence_of :code }
    it { should validate_presence_of :teaching_hours }
    it { should validate_numericality_of(:teaching_hours) }
  end
end
