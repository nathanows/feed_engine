class StateMaritalDataSerializer < ActiveModel::Serializer
  attributes :year,
             :population,
             :male_population,
             :male_never_married,
             :male_ever_married,
             :male_ever_married_and_married_last_year,
             :male_ever_married_and_not_married_last_year,
             :female_population,
             :female_never_married,
             :female_ever_married,
             :female_ever_married_and_married_last_year,
             :female_ever_married_and_not_married_last_year,
             :state,
             :never_married_percentage,
             :ever_married_percentage


  def never_married_percentage
    object.never_married_percentage.round(2)
  end

  def ever_married_percentage
    (object.ever_married_percentage).round(2)
  end
end
