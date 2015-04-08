class Api::V1::Education::TweetsController < ApplicationController

  def index
    render json: Tweet.where(dataset: "education").order(post_time: :desc).
      limit(10), meta: { average: SentimentAnalyzer.new.average_sentiment("education") },
      meta_key: "sentiment"
  end
end
