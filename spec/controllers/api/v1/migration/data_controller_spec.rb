require 'rails_helper'

RSpec.describe Api::V1::Migration::DataController, type: :controller do
  describe 'get index' do
    it "returns list of all data as json" do
      skip
      create(:state_migration_data)
      get :index
      data = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(data.first).to be_a(Hash)
      expect(data.first["year"]).to eq(2010)
      expect(data.first["median_age"]).to eq("38")
      expect(data.first["state"]).to eq("CO")
    end
  end
end
