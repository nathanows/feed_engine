require 'rails_helper'

RSpec.describe Api::V1::Education::DataController, type: :controller do

  describe 'get index' do
    before(:each) { create(:state_education_data) }
    it "returns list of all data as json" do
      get :index
      data = JSON.parse(response.body)["data"]

      expect(response).to have_http_status(:success)
      expect(data.first["year"]).to eq(2012)
      expect(data.first["population"]).to eq(4000000)
      expect(data.first["no_schooling_completed"]).to eq(300000)
      expect(data.first["doctorate_degree"]).to eq(400000)
      expect(data.first["state"]).to eq("NY")
    end

    it "returns json data from state-education-data-serializer" do
      get :index
      data = JSON.parse(response.body)["data"]

      expect(response).to have_http_status(:success)
      expect(data.first["no_schooling_completed_percent"]).to eq(7.5)
      expect(data.first["regular_high_school_diploma_percent"]).to eq(10.0)
      expect(data.first["ged_or_alternative_percent"]).to eq(7.5)
      expect(data.first["bachelors_degree_percent"]).to eq(25.0)
      expect(data.first["masters_degree_percent"]).to eq(12.5)
      expect(data.first["professional_degree_percent"]).to eq(12.5)
      expect(data.first["doctorate_degree_percent"]).to eq(10.0)
    end
  end
end
