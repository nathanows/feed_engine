class CensusService

  def initialize
    @connection = Faraday.new(url: "http://api.census.gov/data/")
  end

  def get_poverty_data(year)
    @connection.get do |req|
      req.url "#{year}/acs5", key: Figaro.census_key
      req.params["get"] = generate_tables("B17001")
      req.params["for"] = all_states
    end
  end

  def save_poverty_data(year)
    data = get_poverty_data(year)
    PovertyDataGenerator.call(data, year)
  end

  #@poverty_data = StatePovertyData.where(state: params[:state]).where(year: params[:year])
  #render json: @poverty_data

  #def under_poverty_percent
    #object.population_under_poverty / object.population
  #end

  #CensusService.new.save_poverty_data(2010)

  def generate_tables(table_number)
    fields= ""

    (1..30).each do |x|
      fields += "#{table_number}_#{'%03i' % x}E,"
    end

    fields = fields[0..-2]
  end

  def all_states
    "state:*"
  end

end
