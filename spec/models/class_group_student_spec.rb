require 'rails_helper'

RSpec.describe ClassGroupStudent, :type => :model do
  describe "associations" do
    it { should belong_to :institute }
    it { should belong_to :student }
    it { should belong_to :class_group }
  end

  describe "validations" do
    it { should validate_presence_of :institute }
    it { should validate_presence_of :student }
    it { should validate_presence_of :class_group }
    it { should validate_numericality_of :roll_number }
  end
end
