class Api::V1::Migration::TweetsController < ApplicationController

  def index
    render json: Tweet.where(dataset: "migration").order(post_time: :desc)
  end
end
