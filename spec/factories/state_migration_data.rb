FactoryGirl.define do
  factory :state_migration_data do
    year                                            2010
    median_age                                      38
    same_house_1_year_ago                           0.4
    moved_within_the_same_county                    0.3
    moved_from_different_county_within_same_state   0.1
    moved_from_different_state                      0.1
    moved_from_abroad                               0.1
    state                                           "CO"
  end
end
