require 'rails_helper'

RSpec.describe Api::V1::Marital::MaritalController, type: :controller do

  describe "Get index" do
    it "returns general data about migration dataset" do
      create(:state_marital_data)
      get :index
      data = JSON.parse(response.body)["marital"]

      expect(response).to have_http_status(:success)
      expect(data.first["data_set_name"]).to eql("Marriages in the Last Year By" +
      " Sex By Marital Status for the Population 15 Years and Over")
      expect(data.first["years_available"])
        .to eq("Data available for the following year(s): [2010]")
    end
  end

end
