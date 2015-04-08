class CensusService
  def initialize
    @connection = Faraday.new(url: "http://api.census.gov/data/")
  end

  def save_poverty_data(year)
    data = parse(get_data("poverty", year))
    PovertyDataGenerator.call(data, year)
  end

  def save_migration_data(year)
    data = parse(get_data("migration", year))
    MigrationDataGenerator.call(data, year)
  end

  def save_education_data(year)
    data = parse(get_data("education", year))
    EducationDataGenerator.call(data,year)
  end

  def save_marital_data(year)
    data = parse(get_data("marital", year))
    MaritalDataGenerator.call(data, year)
  end

  private

  def get_data(type, year)
    @connection.get do |req|
      req.url "#{year}/acs5", key: Figaro.env.census_key
      req.params["get"] = generate_tables(CensusDataMapper.table_names(type), type)
      req.params["for"] = all_states
    end
  end

  def generate_tables(table_number, specifier=nil)
    if specifier == "poverty"
      fields= ""
      (1..30).each do |x|
        fields += "#{table_number}_#{'%03i' % x}E,"
      end
      fields[0..-2]
    elsif specifier == "education"
      fields =""
      fields += "#{table_number}_#{'%03i' % 1}E,"
      fields += "#{table_number}_#{'%03i' % 2}E,"
      fields += "#{table_number}_#{'%03i' % 17}E,"
      fields += "#{table_number}_#{'%03i' % 18}E,"
      fields += "#{table_number}_#{'%03i' % 22}E,"
      fields += "#{table_number}_#{'%03i' % 23}E,"
      fields += "#{table_number}_#{'%03i' % 24}E,"
      fields += "#{table_number}_#{'%03i' % 25}E,"
      fields[0..-2]
    elsif specifier == "migration"
      fields= ""
      (1..6).each do |x|
        fields += "#{table_number}_#{'%03i' % x}E,"
      end
      fields[0..-2]
    elsif specifier == "marital"
      fields = ""
      (1..11).each do |x|
        fields += "#{table_number}_#{'%03i' % x}E,"
      end
      fields[0..-2]
    end
  end

  def all_states
    "state:*"
  end

  def table_lookup(type)
    case type
    when "poverty" then "B17001"
    when "migration" then "B07002"
    when "education" then "B15003"
    when "marital" then "B12501"
    else
      raise ArgumentError "The Table type doesn't exist"
    end
  end

  def parse(data)
    JSON.parse(data.body)
  end
end
