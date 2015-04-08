require 'rails_helper'
require 'sentiment_analyzer'

RSpec.describe SentimentAnalyzer, type: :model do
  let(:tweet) { create(:tweet) }
  let(:tweet1) { create(:tweet, text: "libellous") }

  it "has a no schooling completed helper method" do
    analyzer = SentimentAnalyzer.new
    expect(analyzer.average_sentiment(tweet.dataset)).to eql(-1.0)
  end
end
