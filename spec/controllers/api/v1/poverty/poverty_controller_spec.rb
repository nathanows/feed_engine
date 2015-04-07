require "rails_helper"

RSpec.describe Api::V1::Poverty::PovertyController, type: :controller do

  describe "GET index" do
    it "returns json" do
      state = create(:state_poverty_data)
      get :index
      data = JSON.parse(response.body)["poverty"]

      expect(response).to have_http_status(:success)
      expect(data.first["years_available"]).to eq("Data available for the following year(s): 2010")
    end
  end
end
