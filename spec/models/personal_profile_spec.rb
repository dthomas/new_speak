require 'rails_helper'

RSpec.describe PersonalProfile, :type => :model do
  describe "associations" do
    it { should belong_to :institute }
    it { should belong_to :profileable }
  end

  describe "validations" do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :date_of_birth }
    it { should validate_presence_of :gender }
    it { should validate_presence_of :institute }

    it { should ensure_length_of(:first_name).is_at_least(2).is_at_most(32) }
    it { should ensure_length_of(:last_name).is_at_least(2).is_at_most(32) }
  end
end
