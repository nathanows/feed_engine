require "rails_helper"

RSpec.describe Api::V1::Marital::DataController, type: :controller do
  describe 'get index' do
    skip
    it "returns list of all data as json" do
      create(:state_marital_data)
      get :index
      data = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(data.first).to be_a(Hash)
      expect(data.first["year"]).to eq(2010)
      expect(data.first["population"]).to eq(12400000)
      expect(data.first["male_population_never_married"]).to eq(3200000)
      expect(data.first["state"]).to eq("CO")
    end
  end
end