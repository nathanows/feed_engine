class TwitterDataGenerator

  def self.call(data, dataset)
    data.each do |tweet|
      Tweet.find_or_create_by(
        dataset:       dataset,
        text:          tweet.text,
        screen_name:   tweet.user.screen_name,
        user_name:     tweet.user.name,
        user_prof_pic: tweet.user.profile_image_url,
        post_time:     tweet.created_at,
        location:      tweet.user.location,
        twitter_id:    tweet.id
      )
    end
  end
end
