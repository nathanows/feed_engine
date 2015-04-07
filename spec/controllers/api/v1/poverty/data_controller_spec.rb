require 'rails_helper'

RSpec.describe Api::V1::Poverty::DataController, type: :controller do

  describe "GET index" do

    before(:each) { create(:state_poverty_data) }

    it "returns json" do
      get :index
      data = JSON.parse(response.body)["data"]

      expect(response).to have_http_status(:success)
      expect(data.first["year"]).to eq(2010)
      expect(data.first["population"]).to eq(4000000)
      expect(data.first["population_below_poverty"]).to eq(793000)
      expect(data.first["state"]).to eq("CO")
    end

    it 'returns json from state-poverty-data-serializer' do
      get :index
      data = JSON.parse(response.body)["data"]

      expect(response).to have_http_status(:success)
      expect(data.first["percent_below_poverty"]).to eq(19.825)
      expect(data.first["percent_male_below_poverty"]).to eq(9.75)
      expect(data.first["percent_female_below_poverty"]).to eq(10.075000000000001)
    end
  end
end
