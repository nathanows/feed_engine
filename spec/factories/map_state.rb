FactoryGirl.define do
  factory :map_state do
    short_name  "OR"
    name        "Oregon"
    census_area 113594.084
    geometry    {{ coordinates: [[[-112.538593, 37.000674],
                                 [-114.438266, 34.022609],
                                 [-114.434949, 34.037784],
                                 [-114.435429, 34.079727]],
                                [-114.292663, 34.093043]] }}
  end
end
