FactoryGirl.define do
  factory :state_marital_data do
    year                                                        2010
    population                                                  12400000                                  
    male_population                                             6000000                   
    male_never_married                                          3200000
    male_ever_married                                           2800000
    male_ever_married_and_married_last_year                     300000
    male_ever_married_and_not_married_last_year                 2500000
    female_population                                           6400000                    
    female_never_married                                        3600000
    female_ever_married                                         3200000
    female_ever_married_and_married_last_year                   400000
    female_ever_married_and_not_married_last_year               2900000                  
    state                                                       "CO"
  end
end