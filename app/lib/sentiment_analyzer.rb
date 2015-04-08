class SentimentAnalyzer
  Sentimental.load_defaults

  def initialize
    analyzer = Sentimental.new
  end

  def average_sentiment(dataset)
    scores = Tweet.where(dataset: dataset).map do |tweet|
      tweet.sentiment
    end
    scores.reduce(0.0) {|sum, score| sum + score } / scores.size
  end
end
