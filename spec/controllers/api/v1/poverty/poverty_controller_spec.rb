require "rails_helper"

RSpec.describe Api::V1::Poverty::PovertyController, type: :controller do

  describe "GET index" do
    it "returns json" do
      get :index
      expect(response).to have_http_status(:success)
      data = JSON.parse(response.body)
      expect(data).to be_a(Hash)
    end
  end
end
