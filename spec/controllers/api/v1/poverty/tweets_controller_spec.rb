require 'rails_helper'

RSpec.describe Api::V1::Poverty::TweetsController, type: :controller do

  describe "GET index" do
    it "returns json" do
      tweet = create(:tweet, dataset: "poverty")
      create(:tweet, dataset: "other")
      get :index
      data = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(data["tweets"].first).to be_a(Hash)
      expect(data["tweets"].length).to eq(1)
      expect(data["tweets"].first["dataset"]).to eq("poverty")
      expect(data["tweets"].first["screen_name"]).to eq(tweet.screen_name)
      expect(data["tweets"].first["user_name"]).to eq(tweet.user_name)
    end
  end
end
