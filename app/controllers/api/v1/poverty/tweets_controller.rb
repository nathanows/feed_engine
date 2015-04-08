class Api::V1::Poverty::TweetsController < ApplicationController

  def index
    render json: Tweet.where(dataset: "poverty").order(post_time: :desc)
  end
end
