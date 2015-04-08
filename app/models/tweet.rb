class Tweet < ActiveRecord::Base
  Sentimental.load_defaults
  before_create :add_sentiment

  def add_sentiment
    analyzer = Sentimental.new
    self.sentiment = analyzer.get_score(text)
  end
end
