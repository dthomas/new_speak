require 'rails_helper'

RSpec.describe TeachersController, :type => :controller do

  describe "GET new" do
    it "returns http success" do
      sign_in
      get :new
      expect(response).to have_http_status(:success)
    end
  end

end
