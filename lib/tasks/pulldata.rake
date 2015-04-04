namespace :pull_data do
  desc "Run all data pulls for seeding database"
  task all: :environment do
    Rake::Task["pull_data:census_poverty_2010"].execute
  end

  desc "Pull 2010 census poverty data and save to StatePovertyData model"
  task census_poverty_2010: :environment do
    puts "Pulling census poverty data..."
    results = CensusService.new.save_poverty_data(2010)
    puts "Data pulled! There are now #{results} records in the StatePovertyData model."
  end
end
