class CreateTweet < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string   :dataset
      t.text     :text
      t.string   :screen_name
      t.string   :user_name
      t.string   :user_prof_pic
      t.datetime :post_time
      t.string   :location
      t.integer  :twitter_id, limit: 8
    end
  end
end
