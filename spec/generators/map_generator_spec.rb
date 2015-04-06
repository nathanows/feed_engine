require 'rails_helper'

RSpec.describe MapGenerator do
  it "creates a MapState object given array of geojson features" do
    data = [{"type"=>"Feature",
     "properties"=>{"GEO_ID"=>"0400000US04", "STATE"=>"04", "NAME"=>"Arizona", "LSAD"=>"", "CENSUSAREA"=>113594.084},
     "geometry"=>
      {"type"=>"Polygon",
       "coordinates"=>
          [
            [
              [-112.538593, 37.000674],
              [-114.438266, 34.022609],
              [-114.434949, 34.037784],
              [-114.435429, 34.079727]
            ],
            [-114.292663, 34.093043]
          ]
      }
    }]
    MapGenerator.call(data)
    expect(MapState.count).to eql(1)
  end
end
