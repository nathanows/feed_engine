require 'rails_helper'

RSpec.describe Api::V1::Migration::MigrationController, type: :controller do

  describe "Get index" do
    it "returns general data about migration dataset" do
      create(:state_migration_data)
      get :index
      data = JSON.parse(response.body)["migration"]
      expect(response).to have_http_status(:success)
      expect(data.first["years_available"])
        .to eq("Data available for the following year(s): [2010]")
    end
  end

end
