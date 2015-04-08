require 'rails_helper'

RSpec.describe Tweet, type: :model do
  let(:tweet) { create(:tweet) }
  let(:analyzer) { Sentimental.new }

  it "has a sentiment score" do
    expect(analyzer.get_score(tweet.text)).to eql(-1.0)
  end

  it "has a sentiment" do
    expect(analyzer.get_sentiment(tweet.text)).to eql(:negative)
  end
end
