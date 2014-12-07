require 'rails_helper'

RSpec.describe Course, :type => :model do
  describe "associations" do
    it { should belong_to :institute }
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :abbreviation }
    it { should validate_presence_of :institute }

    it "should validate case insensitive uniqueness for name and abbreviation" do
    	institute = FactoryGirl.create(:institute)
    	FactoryGirl.create(:course, institute: institute)

    	should validate_uniqueness_of(:name).case_insensitive.scoped_to(:institute_id)
    	should validate_uniqueness_of(:abbreviation).case_insensitive.scoped_to(:institute_id)
    end
  end
end
