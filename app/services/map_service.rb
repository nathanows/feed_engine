class MapService
  def self.save_map_data
    response = parse(Faraday.get('http://eric.clst.org/wupl/Stuff/gz_2010_us_040_00_20m.json'))
    MapGenerator.call(response["features"])
  end

  private

  def self.parse(data)
    JSON.parse(data.body)
  end
end
