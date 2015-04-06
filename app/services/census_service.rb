class CensusService

  def initialize
    @connection = Faraday.new(url: "http://api.census.gov/data/")
  end

  def save_poverty_data(year)
    data = parse(get_data("poverty", year))
    PovertyDataGenerator.call(data, year)
  end


  def save_commute_time_data(year)
    data = parse(get_data("commute_time", year))
    CommuteTimeDataGenerator.call(data, year)
  end

  def save_migration_data(year)
    data = parse(get_data("migration", year))
    MigrationDataGenerator.call(data, year)
  end

  def save_education_data(year)
    data = parse(get_data("education", year))
    EducationDataGenerator.call(data,year)
  end

  private

  def get_data(type, year)
    @connection.get do |req|
      req.url "#{year}/acs5", key: Figaro.env.census_key
      req.params["get"] = generate_tables(table_lookup(type), type)
      req.params["for"] = all_states
    end
  end

<<<<<<< HEAD
  def table_lookup(type)
    case type
    when "poverty" then "B17001"
    when "commute_time" then "C08136"
    when 'migration' then 'B07002'
    else
      raise ArgumentError
    end
  end

  def generate_tables(table_number, cols)
    fields= ""

    (1..cols).each do |x|
      fields += "#{table_number}_#{'%03i' % x}E,"
=======
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
>>>>>>> 4eb44372fa8c7816cac3e7f5546b410e2d6e2f70
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
    else
      raise ArgumentError "The Table type doesn't exist"
    end
  end

  def parse(data)
    JSON.parse(data.body)
  end
end
