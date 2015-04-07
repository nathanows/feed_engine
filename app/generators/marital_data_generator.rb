class MaritalDataGenerator
  extend StateLookupHelper

  def self.call(data, year)
    data.each_with_index do |record, i|
      unless i == 0
        a = StateMaritalData.new
        a.year                                                        = year
        a.population                                                  = record[0]
        a.male_population                                             = record[1]
        a.male_never_married                                          = record[2]
        a.male_ever_married                                           = record[3]
        a.male_ever_married_and_married_last_year                     = record[4]
        a.male_ever_married_and_not_married_last_year                 = record[5]
        a.female_population                                           = record[6]
        a.female_never_married                                        = record[7]
        a.female_ever_married                                         = record[8]
        a.female_ever_married_and_married_last_year                   = record[9]
        a.female_ever_married_and_not_married_last_year               = record[10]
        a.state                                                       = record[11]
        a.save
      end
    end
  end
end