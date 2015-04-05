require 'rails_helper'

RSpec.describe CensusService do
  let(:service) { CensusService.new }

  it "returns back census poverty json data" do
    VCR.use_cassette("poverty data", :re_record_interval => 7.days) do
      json_data = service.save_poverty_data(2010)
      expect(json_data.first.first).to eql("B17001_001E")
      expect(json_data.first.last).to eql("state")
      expect(json_data.length).to eql(53)
      json_data.each do |state_data|
        expect(state_data.length).to eql(31)
      end
    end
  end

  it "returns back census population json data" do
    VCR.use_cassette("population data", :re_record_interval => 7.days ) do
      json_data = service.save_migration_data(2010)
      expect(json_data.first.first).to eq("B07002_001E")
      expect(json_data.first.last).to eq("state")
      expect(json_data.length).to eq(53)
      json_data.each do |columns|
        expect(columns.count).to eq(7)
      end
    end
  end
end
