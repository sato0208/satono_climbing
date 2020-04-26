require 'rails_helper'

RSpec.describe "Climbers::Jims", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/climbers/jims/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/climbers/jims/show"
      expect(response).to have_http_status(:success)
    end
  end

end
