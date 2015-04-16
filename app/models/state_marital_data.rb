class StateMaritalData < ActiveRecord::Base

  def never_married_percentage
    ((self.male_never_married + self.female_never_married) / self.population.to_f) * 100
  end

  def ever_married_percentage
    ((self.male_ever_married + self.female_ever_married) / self.population.to_f) * 100
  end
end
