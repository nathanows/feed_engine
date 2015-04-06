namespace :pull_data do
  desc "Run all data pulls for seeding database"
  task all: :environment do
    Rake::Task["pull_data:map_geojson"].execute
    Rake::Task["pull_data:census_migration_2010"].execute
    Rake::Task["pull_data:census_poverty_2010"].execute
  end

  desc "Pull 2010 census migration data and save to StateMigrationData model"
  task census_migration_2010: :environment do
    puts "Pulling census migration data..."
    CensusService.new.save_migration_data(2010)
    puts "Data pulled! There are now #{StateMigrationData.where(year: 2010).count}
    records in the StateMigrationData model"
  end

  desc "Pull 2010 census poverty data and save to StatePovertyData model"
  task census_poverty_2010: :environment do
    puts "Pulling census poverty data..."
    CensusService.new.save_poverty_data(2010)
    puts "Data pulled! There are now #{StatePovertyData.where(year: 2010).count}
    records in the StatePovertyData model."
  end

  desc "Pull base map data and save to MapState model"
  task map_geojson: :environment do
    puts "Pulling geojson map data..."
    MapService.save_map_data
    puts "Map data pulled! There are now #{MapState.count} records in the MapState model."
  end
end
