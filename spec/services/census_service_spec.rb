require "rails_helper"

RSpec.describe CensusService do
  let(:service) { CensusService.new }

  it "returns json census poverty data for 2010" do
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

  it "returns json census average commute time data for 2010" do
    VCR.use_cassette("commute time data", :re_record_interval => 7.days) do
      json_data = service.save_commute_time_data(2010)
    end
  end
end
