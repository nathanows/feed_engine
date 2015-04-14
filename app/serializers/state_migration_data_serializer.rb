class StateMigrationDataSerializer < ActiveModel::Serializer
  attributes :id,
             :year,
             :median_age,
             :same_house_1_year_ago,
             :moved_within_the_same_county,
             :moved_from_different_county_within_same_state,
             :moved_from_different_state,
             :moved_from_abroad,
             :state,
             :different_state_percent,
             :from_abroad_percent

  def different_state_percent
    round_number(object.moved_from_different_state)
  end

  def from_abroad_percent
    round_number(object.moved_from_abroad)
  end

  def round_number(attribute1)
    attribute1.round(2)
  end
end
