require 'rails_helper'

RSpec.describe Teacher, :type => :model do
  describe "associations" do
    it { should belong_to :institute }
    it { should belong_to :person }
    it { should belong_to :user }
  end

  describe "validations" do
    it { should validate_presence_of :date_of_joining }
    it { should validate_presence_of :employee_number }
  end
end
