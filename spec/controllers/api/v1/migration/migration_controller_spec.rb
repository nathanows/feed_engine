require 'rails_helper'

RSpec.describe Api::V1::Migration::MigrationController, type: :controller do

  describe "Get index" do
    it "returns general data about migration dataset" do
      get :index
      data = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(data).to be_a(Hash)
    end
  end

end
