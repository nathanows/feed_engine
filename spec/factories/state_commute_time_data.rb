FactoryGirl.define do
  factory :state_migration_data do
    year                                          2010
    total_commuting_workers                       0.4
    commuting_60_to_89_minutes                    0.4
    commuting_over_89_minutes                     0.3
    state                                         "CO"
  end
end