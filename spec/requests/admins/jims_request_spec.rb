require 'rails_helper'

RSpec.describe "Admins::Jims", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/admins/jims/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/admins/jims/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/admins/jims/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/admins/jims/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/admins/jims/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/admins/jims/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
