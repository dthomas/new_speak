require 'rails_helper'

RSpec.describe PersonType, :type => :model do
	describe "associations" do
	  it { should have_many :people }
	end
	
  describe "validations" do
    it { should validate_presence_of :name }
  end
end
