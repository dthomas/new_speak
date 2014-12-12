require 'rails_helper'

RSpec.describe ClassGroup, :type => :model do
  describe "associations" do
    it { should belong_to :course_session }
    it { should belong_to :institute }
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :start_date }
    it { should validate_presence_of :end_date }
    it { should validate_presence_of :course_session }
    it { should validate_presence_of :institute }
  end
end
