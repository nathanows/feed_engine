require 'rails_helper'

RSpec.describe Api::V1::Education::EducationController, type: :controller do

  describe "Get index" do
    it "returns general data about education dataset" do
      create(:state_education_data)
      get :index
      data = JSON.parse(response.body)["education"]
      
      expect(response).to have_http_status(:success)
      expect(data.first["data_set_name"]).to eql("EDUCATIONAL ATTAINMENT FOR THE POPULATION 25 YEARS AND OVER")
      expect(data.first["years_available"]).to eql("Data available for the following year(s): [2012]")
    end
  end
end
