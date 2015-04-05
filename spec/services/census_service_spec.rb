require 'rails_helper'

RSpec.describe CensusService do
  let(:service) { CensusService.new }

  it "returns back poverty census json data" do
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

  it "returns back education census json data" do
    VCR.use_cassette("education data", :re_record_interval => 7.days) do
      json_data = service.save_education_data(2010)
      expect(json_data.first.first).to eql("B15001_001E")
      expect(json_data.first.second).to eql("B15001_002E")
      expect(json_data.first.third).to eql("B15001_003E")
      expect(json_data.first.fourth).to eql("B15001_006E")
      expect(json_data.first.fifth).to eql("B15001_007E")
      expect(json_data.first[5]).to eql("B15001_009E")
      expect(json_data.first.last).to eql("state")
      expect(json_data.length).to eql(53)
      json_data.each do |state_data|
        expect(state_data.length).to eql(44)
      end
    end
  end
end
