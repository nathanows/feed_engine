class Api::V1::Poverty::TweetsController < ApplicationController

  def index
    render json: Tweet.where(dataset: "poverty").order(post_time: :desc).
    limit(10), meta: { average: SentimentAnalyzer.new.average_sentiment("poverty") },
    meta_key: "sentiment"
  end
end
