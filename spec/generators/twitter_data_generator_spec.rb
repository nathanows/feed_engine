require 'rails_helper'

RSpec.describe PovertyDataGenerator do
  it "creates a StatePovertyData object from the api data arrays" do
    tweets = Array.new(1, Hashie::Mash.new(
      text: "This is just a sample tweet... #yolo",
      created_at: Time.now,
      id: 12312423523453423,
      user: {
        screen_name: "yolo_monster",
        name: "Yolo Monster",
        profile_image_url: "http://www.example.com/sdfsdfsdf",
        location: "Mars... Or something"
      }
    ))
    TwitterDataGenerator.call(tweets, "poverty")
    expect(Tweet.count).to eql(1)
    expect(Tweet.first.dataset).to eq("poverty")
  end
end
