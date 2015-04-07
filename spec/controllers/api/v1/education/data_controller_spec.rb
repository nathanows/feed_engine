require 'rails_helper'

RSpec.describe Api::V1::Education::DataController, type: :controller do

  describe 'get index' do
    it "returns list of all data as json" do
      create(:state_education_data)
      get :index
      data = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(data.first).to be_a(Hash)
      expect(data.first["year"]).to eq(2012)
      expect(data.first["population"]).to eq(4000000)
      expect(data.first["no_schooling_completed"]).to eq(300000)
      expect(data.first["doctorate_degree"]).to eq(400000)
      expect(data.first["state"]).to eq("NY")
    end
  end
end
