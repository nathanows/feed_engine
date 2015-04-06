class CensusService

  def initialize
    @connection = Faraday.new(url: "http://api.census.gov/data/")
  end

  def get_poverty_data(year)
    @connection.get do |req|
      req.url "#{year}/acs5", key: Figaro.env.census_key
      req.params["get"] = generate_tables("B17001", "poverty")
      req.params["for"] = all_states
    end
  end

  #only exists for 2012 and 2013.
  def get_education_data(year)
    @connection.get do |req|
      req.url"#{year}/acs5", key: Figaro.env.census_key
      req.params["get"] = generate_tables("B15003", "education")
      req.params["for"] = all_states
    end
  end

  def save_poverty_data(year)
    data = parse(get_poverty_data(year))
    PovertyDataGenerator.call(data, year)
  end

  def save_education_data(year)
    data = parse(get_education_data(year))
    EducationDataGenerator.call(data,year)
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
    end
  end

  def all_states
    "state:*"
  end

  private

  def parse(data)
    JSON.parse(data.body)
  end
  #
  # def education_iterate(start_number, fields, table_number)
  #   5.times do |i|
  #     increment = 8 * i
  #     initial_array = [start_number, start_number+3, start_number+4, start_number+6]
  #     initial_array.each do |suffix_number|
  #       fields += "#{table_number}_#{'%03i' % (suffix_number + increment)}E,"
  #     end
  #   end
  #   fields
  # end
end
