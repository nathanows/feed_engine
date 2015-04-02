require 'rails_helper'

RSpec.describe CensusService do
  let(:service) { CensusService.new }

  it "returns back census json data" do
    VCR.use_cassette("poverty data") do
      json_data = service.save_poverty_data(2010)
      expect(json_data.first.first).to eql("B17001_001E")
    end
  end
end
