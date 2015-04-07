class StateEducationDataSerializer < ActiveModel::Serializer
  attributes :id,
             :year,
             :population,
             :no_schooling_completed,
             :regular_high_school_diploma,
             :ged_or_alternative,
             :bachelors_degree,
             :masters_degree,
             :professional_degree,
             :doctorate_degree,
             :state,
             :no_schooling_completed_percent,
             :high_school_diploma_or_ged_percent,
             :college_or_above_percent

  def no_schooling_completed_percent
    to_percent(object.no_schooling_completed)
  end

  def high_school_diploma_or_ged_percent
    to_percent(object.regular_high_school_diploma, object.ged_or_alternative)
  end

  def college_or_above_percent
    to_percent(object.bachelors_degree,
               object.masters_degree,
               object.professional_degree,
               object.doctorate_degree)
  end

  def to_percent(*attributes)
    attributes.reduce(:+) / object.population.to_f * 100
  end
end
