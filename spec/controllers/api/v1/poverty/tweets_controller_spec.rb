require 'rails_helper'

RSpec.describe Api::V1::Poverty::TweetsController, type: :controller do

  describe "GET index" do
    it "returns json" do
      tweet = create(:tweet, dataset: "poverty")
      tweet = create(:tweet, dataset: "other")
      get :index
      data = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(data.first).to be_a(Hash)
      expect(data.length).to eq(1)
      expect(data.first["dataset"]).to eq("poverty")
      expect(data.first["screen_name"]).to eq(tweet.screen_name)
      expect(data.first["user_name"]).to eq(tweet.user_name)
    end
  end
end
