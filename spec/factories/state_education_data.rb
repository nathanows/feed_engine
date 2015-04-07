FactoryGirl.define do
  factory :state_education_data do
    year                                          2012
    population                                    4000000
    no_schooling_completed                        300000
    regular_high_school_diploma                   400000
    ged_or_alternative                            300000
    bachelors_degree                              1000000
    masters_degree                                500000
    professional_degree                           500000
    doctorate_degree                              400000
    state                                         "NY"
  end
end
