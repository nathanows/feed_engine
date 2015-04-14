FactoryGirl.define do
  factory :state_migration_data do
    year                                          2010
    median_age                                    38
    same_house_1_year_ago                         40
    moved_within_the_same_county                  30
    moved_from_different_county_within_same_state 10
    moved_from_different_state                    10
    moved_from_abroad                             10
    state                                         "CO"
  end
end
