class TwitterService
  attr_reader :client

  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Figaro.env.twitter_consumer_key
      config.consumer_secret     = Figaro.env.twitter_consumer_secret
    end
  end

  def find(dataset, num_tweets = 500)
    tweets = client.search(terms(dataset), result_type: "recent", lang: "en")
      .take(num_tweets)
    TwitterDataGenerator.call(tweets, dataset)
  end

  private

  def terms(dataset)
    case dataset
    when "poverty" then "%23poverty OR poverty"
    when "migration" then "%23transplants OR %23moving OR transplants"
    when "education" then "%23education OR education"
    when "marital" then "%23marriage OR marriage"
    else
      raise ArgumentError "The dataset specified doesn't exist"
    end
  end
end
