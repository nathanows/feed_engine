class StatePovertyDataSerializer < ActiveModel::Serializer
  attributes :id,
             :year,
             :population,
             :population_below_poverty,
             :male_below_poverty,
             :male_below_poverty_under5,
             :male_below_poverty_5,
             :male_below_poverty_6to11,
             :male_below_poverty_12to14,
             :male_below_poverty_15,
             :male_below_poverty_16to17,
             :male_below_poverty_18to24,
             :male_below_poverty_25to34,
             :male_below_poverty_35to44,
             :male_below_poverty_45to54,
             :male_below_poverty_55to64,
             :male_below_poverty_65to74,
             :male_below_poverty_over75,
             :female_below_poverty,
             :female_below_poverty_under5,
             :female_below_poverty_5,
             :female_below_poverty_6to11,
             :female_below_poverty_12to14,
             :female_below_poverty_15,
             :female_below_poverty_16to17,
             :female_below_poverty_18to24,
             :female_below_poverty_25to34,
             :female_below_poverty_35to44,
             :female_below_poverty_45to54,
             :female_below_poverty_55to64,
             :female_below_poverty_65to74,
             :female_below_poverty_over75,
             :state,
             :percent_below_poverty,
             :percent_male_below_poverty,
             :percent_female_below_poverty


  def percent_below_poverty
    to_percentage(object.population_below_poverty)
  end

  def percent_male_below_poverty
    to_percentage(object.male_below_poverty)
  end

  def percent_female_below_poverty
    to_percentage(object.female_below_poverty)
  end

  def to_percentage(attribute1)
    attribute1 / object.population.to_f * 100
  end
end
