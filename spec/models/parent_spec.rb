require 'rails_helper'

RSpec.describe Parent, :type => :model do
  describe "associations" do
    # it { should belong_to :institute }
    # it { should belong_to :family }

    # it { should have_one :personal_profile }
    # it { should have_many :students }
  end

  describe "validations" do
    it { should validate_presence_of :institute }
    it { should validate_presence_of :relation }
    it { should validate_presence_of :occupation }
  end
end
