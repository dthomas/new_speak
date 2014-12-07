require 'rails_helper'

RSpec.describe Parent, :type => :model do
  describe "associations" do
    it { should belong_to :person }
    it { should belong_to :institute }

    it { should have_many :families }
    it { should have_many :students }
  end

  describe "validations" do
    it { should validate_presence_of :relation }
  end
end
