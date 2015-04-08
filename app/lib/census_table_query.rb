class CensusTableQuery

  def self.format(table_number, specifier)
    specifier_to_census_columns[specifier].map do |x|
      "#{table_number}_#{'%03i' % x}E"
    end.join(",")
  end


    # if specifier == "poverty"
    #   POVERTY_COLUMNS.map do |x|
    #     "#{table_number}_#{'%03i' % x}E"
    #   end.join(",")
    # elsif specifier == "education"
    #   EDUCATION_COLUMNS.map do |x|
    #     "#{table_number}_#{'%03i' % x}E"
    #   end.join(",")
    # elsif specifier == "migration"
    #   MIGRATION_COLUMNS.map do |x|
    #     "#{table_number}_#{'%03i' % x}E"
    #   end.join(",")
    # elsif specifier == "marital"
    #   MARITAL_COLUMNS.map do |x|
    #     "#{table_number}_#{'%03i' % x}E"
    #   end.join(",")
    # end
  # end

  private

  def self.specifier_to_census_columns
    {
      "poverty" => (1..30).to_a,
      "education" => [1,2,17,18,22,23,24,25],
      "migration" => (1..6).to_a,
      "marital" => (1..11).to_a,
    }
  end
end
