require 'rails_helper'

RSpec.describe User, :type => :model do
  describe "associations" do
    it { should belong_to :institute }
    it { should belong_to :loginable }
  end

  describe "validations" do
    it { should validate_presence_of :email }
    it { should validate_presence_of :password }
    it { should validate_confirmation_of :password }
  end
end
