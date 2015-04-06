require "rails_helper"

RSpec.describe Api::V1::CommuteTime::DataController, type: :controller do
  describe 'get index' do
    it "returns list of all data as json" do
      skip
      create(:state_commute_time_data)
      get :index
      data = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(data.first).to be_a(Hash)
      expect(data.first["year"]).to eq(2010)
      expect(data.first[""]).to eq("")
      expect(data.first["state"]).to eq("CO")
    end
  end
end