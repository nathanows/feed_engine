require 'rails_helper'

RSpec.describe MapService do
  it "returns back map geojson data" do
    VCR.use_cassette("map data", :re_record_interval => 7.days) do
      json_data = MapService.save_map_data
      expect(json_data.first["type"]).to eql("Feature")
      expect(json_data.first["properties"]["NAME"]).to eql("Arizona")
      expect(json_data.first["geometry"]["coordinates"]).to be_truthy
      expect(json_data.length).to eql(52)
    end
  end
end
