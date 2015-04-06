require 'rails_helper'

RSpec.describe StateEducationData, type: :model do
  let(:data) { create(:state_education_data) }

  it "has a no schooling completed helper method" do
    assert_equal 0.075, data.no_schooling_completed_percentage
  end

  it "has a high school completed helper method" do
    assert_equal 0.2, data.high_school_or_equiv_completed_percentage
  end

  it "has a college or greater completed helper method" do
    assert_equal 0.6, data.college_or_greater_completed_percentage
  end
end
