class StateEducationData < ActiveRecord::Base

  def no_schooling_completed_percentage
    self.no_schooling_completed / self.population.to_f
  end

  def high_school_or_equiv_completed_percentage
    (self.regular_high_school_diploma +
    self.regular_high_school_diploma) /
      self.population.to_f
  end

  def college_or_greater_completed_percentage
    (self.bachelors_degree +
    self.masters_degree +
    self.professional_degree +
    self.doctorate_degree) /
      self.population.to_f
  end
end
