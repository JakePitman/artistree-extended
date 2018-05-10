require 'rails_helper'

RSpec.describe CurrentUserController, type: :controller do

  describe "GET #profile" do
    it "returns http success" do
      get :profile
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #incoming_requests" do
    it "returns http success" do
      get :incoming_requests
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #outgoing_requests" do
    it "returns http success" do
      get :outgoing_requests
      expect(response).to have_http_status(:success)
    end
  end

end
