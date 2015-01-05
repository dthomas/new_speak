require 'rails_helper'

RSpec.describe Person, :type => :model do
  describe "associations" do
    it { should belong_to :family }
    it { should belong_to :institute }
  end

  describe "validations" do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :date_of_birth }
    it { should validate_presence_of :gender }
    it { should validate_presence_of :person_type }
    it { should validate_presence_of :family }
    it { should validate_presence_of :institute }
  end
end
