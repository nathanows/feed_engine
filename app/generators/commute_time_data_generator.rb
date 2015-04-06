class CommuteTimeDataGenerator
  extend StateLookupHelper

  def self.call(data, year)
    data.each_with_index do |record, i|
      unless i == 0
        a = StateCommuteTimeData.new
        a.year                                     = year
        a.total_commuting_workers                  = record[0]
        a.commuting_60_to_89_min                   = record[1]
        a.commuting_over_89_min                    = record[2]
        a.state                                    = record[3]
        a.save
      end
    end
  end
end