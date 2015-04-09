class PovertyDataGenerator

  def self.call(data, year)
    data.each_with_index do |record, i|
      unless i == 0
        a = StatePovertyData.new
        a.year                        = year
        a.population                  = record[0]
        a.population_below_poverty    = record[1]
        a.male_below_poverty          = record[2]
        a.male_below_poverty_under5   = record[3]
        a.male_below_poverty_5        = record[4]
        a.male_below_poverty_6to11    = record[5]
        a.male_below_poverty_12to14   = record[6]
        a.male_below_poverty_15       = record[7]
        a.male_below_poverty_16to17   = record[8]
        a.male_below_poverty_18to24   = record[9]
        a.male_below_poverty_25to34   = record[10]
        a.male_below_poverty_35to44   = record[11]
        a.male_below_poverty_45to54   = record[12]
        a.male_below_poverty_55to64   = record[13]
        a.male_below_poverty_65to74   = record[14]
        a.male_below_poverty_over75   = record[15]
        a.female_below_poverty        = record[16]
        a.female_below_poverty_under5 = record[17]
        a.female_below_poverty_5      = record[18]
        a.female_below_poverty_6to11  = record[19]
        a.female_below_poverty_12to14 = record[20]
        a.female_below_poverty_15     = record[21]
        a.female_below_poverty_16to17 = record[22]
        a.female_below_poverty_18to24 = record[23]
        a.female_below_poverty_25to34 = record[24]
        a.female_below_poverty_35to44 = record[25]
        a.female_below_poverty_45to54 = record[26]
        a.female_below_poverty_55to64 = record[27]
        a.female_below_poverty_65to74 = record[28]
        a.female_below_poverty_over75 = record[29]
        a.state                       = CensusDataMapper::STATE_NAMES[record[30]]
        a.save
      end
    end
  end
end
