require "rails_helper"

RSpec.describe Api::V1::Marital::MaritalController, type: :controller do
  describe "Get index" do
    skip
    it "returns general data about marital dataset" do
      get :index
      data = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(data).to be_a(Hash)
    end
  end
end
