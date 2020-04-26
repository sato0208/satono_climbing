require 'rails_helper'

RSpec.describe "Admins::Climbers", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/admins/climbers/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/admins/climbers/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/admins/climbers/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/admins/climbers/update"
      expect(response).to have_http_status(:success)
    end
  end

end
