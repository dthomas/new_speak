require 'rails_helper'

RSpec.describe Family, :type => :model do
  describe "associations" do
    it { should belong_to :institute }
    it { should belong_to :parent }
    it { should belong_to :student }
  end

  describe "validations" do
    it { should validate_presence_of :name }
  end
end
