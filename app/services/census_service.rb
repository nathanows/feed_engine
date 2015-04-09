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
    CensusTableQuery.format(table_number, specifier)
  end

  def all_states
    "state:*"
  end

  def parse(data)
    JSON.parse(data.body)
  end
end
