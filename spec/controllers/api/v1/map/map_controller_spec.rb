require "rails_helper"

RSpec.describe Api::V1::Map::MapController, type: :controller do

  describe "GET index" do
    it "returns json" do
      get :index
      data = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(data).to be_a(Hash)
    end
  end
end
