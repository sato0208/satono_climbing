require 'rails_helper'

RSpec.describe "Climbers::Ships", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/climbers/ships/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/climbers/ships/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/climbers/ships/destroy"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/climbers/ships/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/climbers/ships/create"
      expect(response).to have_http_status(:success)
    end
  end

end
