require 'rails_helper'

RSpec.describe TwitterService do
  it "returns back twitter objects" do
    VCR.use_cassette("twitter data", :re_record_interval => 7.days) do
      tweets = TwitterService.new.find("poverty", 10)
      expect(tweets.count).to eql(10)
      expect(tweets.first.text.downcase).to include("poverty")
    end
  end
end
