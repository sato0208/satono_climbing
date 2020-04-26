require 'rails_helper'

RSpec.describe "Climbers::Items", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/climbers/items/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/climbers/items/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /top" do
    it "returns http success" do
      get "/climbers/items/top"
      expect(response).to have_http_status(:success)
    end
  end

end
