class CommuteTimeDataGenerator
  extend StateLookupHelper

  def self.call(data, year)
    data.each_with_index do |record, i|
      unless i == 0
        a = StateCommuteTimeData.new
        a.year                        = year
        a.population                  = record[0]
        a.state                       = state_names[record[30]]
        a.save
      end
    end
  end
end