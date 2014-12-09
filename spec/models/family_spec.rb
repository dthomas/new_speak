require 'rails_helper'

RSpec.describe Family, :type => :model do
  describe "associations" do
    it { should belong_to :institute }
    it { should have_many :parents }
    it { should have_many :students }
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :institute }
  end
end
