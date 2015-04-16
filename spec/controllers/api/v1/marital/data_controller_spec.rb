require 'rails_helper'

RSpec.describe Api::V1::Marital::DataController, type: :controller do
  describe 'get index' do
    it "returns list of all data as json" do
      create(:state_marital_data)
      get :index
      data = JSON.parse(response.body)["data"]
      expect(response).to have_http_status(:success)
      expect(data.first).to be_a(Hash)
      expect(data.first["year"]).to eq(2010)
      expect(data.first["male_population"]).to eq(6000000)
      expect(data.first["state"]).to eq("CO")
    end

    it "returns json data from state-marriage-data-serializer" do
      create(:state_marital_data)
      get :index
      data = JSON.parse(response.body)["data"]

      expect(response).to have_http_status(:success)
      expect(data.first["never_married_percentage"]).to eq(54.84)
      expect(data.first["ever_married_percentage"]).to eq(48.39)
    end
  end
end
