class EducationDataGenerator
  extend StateLookupHelper

  # remember that the first array is just table columns so we want to skip that.
  # Data is the form of nested arrays which is unusual for json data.

  def self.call(data, year)
    data.each_with_index do |record, i|
      unless i == 0
        a                             = StateEducationData.new
        a.year                        = year
        a.population                  = record[0]
        a.no_schooling_completed      = record[1]
        a.regular_high_school_diploma = record[2]
        a.ged_or_alternative          = record[3]
        a.bachelors_degree            = record[4]
        a.masters_degree              = record[5]
        a.professional_degree         = record[6]
        a.doctorate_degree            = record[7]
        a.state                       = state_names[record[30]]
        a.save
      end
    end
  end
end
