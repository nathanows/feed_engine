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
             :regular_high_school_diploma_percent,
             :ged_or_alternative_percent,
             :bachelors_degree_percent,
             :masters_degree_percent,
             :professional_degree_percent,
             :doctorate_degree_percent

  def no_schooling_completed_percent
    to_percent(object.no_schooling_completed)
  end

  def regular_high_school_diploma_percent
    to_percent(object.regular_high_school_diploma)
  end

  def ged_or_alternative_percent
    to_percent(object.ged_or_alternative)
  end

  def bachelors_degree_percent
    to_percent(object.bachelors_degree)
  end

  def masters_degree_percent
    to_percent(object.masters_degree)
  end

  def professional_degree_percent
    to_percent(object.professional_degree)
  end

  def doctorate_degree_percent
    to_percent(object.doctorate_degree)
  end

  def to_percent(attribute1)
    attribute1 / object.population.to_f * 100
  end
end
