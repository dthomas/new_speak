require 'rails_helper'

RSpec.describe CourseSessionParticipant, :type => :model do
  describe "associations" do
    it { should belong_to :course_session }
    it { should belong_to :student }
    it { should belong_to :institute }
  end

  describe "validations" do
    it { should validate_presence_of :institute }
  end
end
