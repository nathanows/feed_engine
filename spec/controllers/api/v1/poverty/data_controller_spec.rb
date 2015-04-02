require 'rails_helper'

RSpec.describe Api::V1::Poverty::DataController, type: :controller do

  describe "GET index" do
    it "returns json" do
      state = create(:state_poverty_data)
      get :index
      data = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(data.first).to be_a(Hash)
      expect(data.first["year"]).to eq(2010)
      expect(data.first["population"]).to eq(4000000)
      expect(data.first["population_below_poverty"]).to eq(793000)
      expect(data.first["state"]).to eq("CO")
    end
  end
end
