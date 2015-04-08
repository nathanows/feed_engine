FactoryGirl.define do
  factory :tweet do
    dataset       "dummy"
    text          "sewing dummy #burn"
    screen_name   "dumdum"
    user_name     "Hello all"
    user_prof_pic "http://www.sewersunite.com"
    post_time     Time.now
    location      "Houston, TX"
    twitter_id    123124235242342
  end
end
