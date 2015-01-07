require 'rails_helper'

RSpec.describe Family, :type => :model do
  describe "associations" do
    # it { should belong_to :institute }
    # it { should have_many :parents }
    # it { should have_many :students }
    # it { should have_many :teachers }
    it { should belong_to :person }
    it { should belong_to :relative }
  end

  describe "validations" do
    it { should validate_presence_of :person }
    it { should validate_presence_of :relative }
  end
end
