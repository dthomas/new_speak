require 'rails_helper'

RSpec.describe Institute, :type => :model do
  describe "associations" do
    it { should belong_to :owner }
    it { should have_many :users }
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :abbreviation }
    it { should validate_presence_of :subdomain }
    it { should validate_presence_of :phone }
  end
end
