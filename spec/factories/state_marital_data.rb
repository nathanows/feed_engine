FactoryGirl.define do
  factory :state_marital_data do
    year                                                        2010
    population                                                  12.4                                  
    male_population                                             6.0                   
    male_never_married                                          3.2
    male_ever_married                                           2.8
    male_ever_married_and_married_in_last_year                  0.3
    male_ever_married_and_not_married_in_last_year              2.5
    female_population                                           6.4                    
    female_never_married                                        3.6
    female_ever_married                                         3.2
    female_ever_married_and_married_in_last_year                0.4
    female_ever_married_and_not_married_in_last_year            2.9                  
    state                                                       "CO"
  end
end