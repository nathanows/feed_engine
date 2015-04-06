require "rails_helper"

RSpec.describe Api::V1::Map::MapController, type: :controller do

  describe "GET index" do
    it "returns json" do
      create(:map_state)
      get :index
      data = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(data.first).to be_a(Hash)
      expect(data.first["name"]).to eq("Oregon")
      expect(data.first["short_name"]).to eq("OR")
      expect(data.first["geometry"]["coordinates"]).to eq("[[[-112.538593, 37.000674], [-114.438266, 34.022609], [-114.434949, 34.037784], [-114.435429, 34.079727]], [-114.292663, 34.093043]]")
    end
  end
end
