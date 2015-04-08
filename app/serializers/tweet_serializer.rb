class TweetSerializer < ActiveModel::Serializer
  attributes :id,
             :dataset,
             :text,
             :screen_name,
             :user_name,
             :user_prof_pic,
             :post_time,
             :location,
             :twitter_id,
             :sentiment
end
