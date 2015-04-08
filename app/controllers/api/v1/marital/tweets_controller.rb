class Api::V1::Marital::TweetsController < ApplicationController
  def index
    render json: Tweet.where(dataset: "marital").order(post_time: :desc).
      limit(10), meta: { average: SentimentAnalyzer.new.average_sentiment("marital") },
      meta_key: "sentiment"
  end
end
