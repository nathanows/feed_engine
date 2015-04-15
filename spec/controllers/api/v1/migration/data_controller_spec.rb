require 'rails_helper'

RSpec.describe Api::V1::Migration::DataController, type: :controller do
  describe 'get index' do

    before(:each) { create(:state_migration_data) }

    it "returns list of all data as json" do
      get :index
      data = JSON.parse(response.body)["data"]

      expect(response).to have_http_status(:success)
      expect(data.first["year"]).to eq(2010)
      expect(data.first["median_age"]).to eq(38.0)
      expect(data.first["state"]).to eq("CO")
    end

    it "returns json from state-migration-data-serializer" do
      get :index
      data = JSON.parse(response.body)["data"]

      expect(response).to have_http_status(:success)
      expect(data.first["different_state_percent"]).to eq(10.0)
      expect(data.first["from_abroad_percent"]).to eq(10.0)
    end
  end
end
