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
    object.no_schooling_completed_percentage
  end

  def high_school_diploma_or_ged_percent
    object.high_school_or_equiv_completed_percentage
  end

  def college_or_above_percent
    object.college_or_greater_completed_percentage
  end
end
