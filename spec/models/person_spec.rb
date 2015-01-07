require 'rails_helper'

RSpec.describe Person, :type => :model do
  describe "associations" do
    it { should have_many :families }
    it { should have_many :relatives }
    it { should belong_to :institute }
  end

  describe "validations" do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :date_of_birth }
    it { should validate_presence_of :gender }
    it { should validate_presence_of :role }
    it { should validate_presence_of :institute }
  end
end
