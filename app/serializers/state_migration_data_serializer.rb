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
             :same_house_percent,
             :same_county_percent,
             :different_county_same_state_percent,
             :different_state_percent,
             :from_abroad_percent

  def same_house_percent
    to_percentage(object.same_house_1_year_ago)
  end

  def same_county_percent
    to_percentage(object.moved_within_the_same_county)
  end

  def different_county_same_state_percent
    to_percentage(object.moved_from_different_county_within_same_state)
  end

  def different_state_percent
    to_percentage(object.moved_from_different_state)
  end

  def from_abroad_percent
    to_percentage(object.moved_from_abroad)
  end

  def to_percentage(attribute1)
    attribute1.to_f * 100
  end
end
