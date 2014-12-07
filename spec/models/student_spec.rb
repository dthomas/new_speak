require 'rails_helper'

RSpec.describe Student, :type => :model do
  describe "associations" do
    it { should belong_to :institute }
    it { should belong_to :person }
    it { should belong_to :user }

    it { should have_many :families }
    it { should have_many :parents }
    it { should have_many :siblings }
  end

  it { should validate_presence_of :person }
  it { should validate_presence_of :date_of_admission }
  it { should validate_presence_of :admission_number }
  it { should validate_presence_of :person }
  it { should validate_presence_of :institute }
end
