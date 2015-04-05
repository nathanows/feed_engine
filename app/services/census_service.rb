class CensusService

  def initialize
    @connection = Faraday.new(url: "http://api.census.gov/data/")
  end

  def save_poverty_data(year)
    data = parse(get_data('poverty', 30, year))
    PovertyDataGenerator.call(data, year)
    StatePovertyData.where(year: 2010).count
  end

  def save_migration_data(year)
    data = parse(get_data('migration', 6, year))
    MigrationDataGenerator.call(data, year)
  end

  private

  def get_data(type, cols, year)
    @connection.get do |req|
      req.url "#{year}/acs5", key: Figaro.env.census_key
      req.params["get"] = generate_tables(table_lookup(type), cols)
      req.params["for"] = all_states
    end
  end

  def table_lookup(type)
    case type
    when 'poverty' then 'B17001'
    when 'migration' then 'B07002'
    else
      raise ArgumentError
    end
  end

  def generate_tables(table_number, cols)
    fields= ""

    (1..cols).each do |x|
      fields += "#{table_number}_#{'%03i' % x}E,"
    end

    fields = fields[0..-2]
  end

  def all_states
    "state:*"
  end

  def parse(data)
    JSON.parse(data.body)
  end
end
