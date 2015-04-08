class Api::V1::Education::TweetsController < ApplicationController

  def index
    render json: Tweet.where(dataset: "education").order(post_time: :desc)
  end
end
