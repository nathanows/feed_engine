class Api::V1::Migration::TweetsController < ApplicationController

  def index
    render json: Tweet.where(dataset: "migration").order(post_time: :desc).
    limit(10), meta: { average: SentimentAnalyzer.new.average_sentiment("migration") },
    meta_key: "sentiment"
  end
end
