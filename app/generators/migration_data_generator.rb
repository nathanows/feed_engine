class MigrationDataGenerator
  def self.call(data, year)
    data.each_with_index do |record, i|
      unless i == 0
        a = StateMigrationData.new
        a.year
        a.median_age                                    = record[0]
        a.same_house_1_year_ago                         = record[1]
        a.moved_within_the_same_county                  = record[2]
        a.moved_from_different_county_within_same_state = record[3]
        a.moved_from_different_state                    = record[4]
        a.moved_from_abroad                             = record[5]
        a.state                                         = record[6]
        a.save
      end
    end
  end
end
