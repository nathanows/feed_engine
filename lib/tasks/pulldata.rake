namespace :pull_data do
  desc "Run all data pulls for seeding database"
  task all: :environment do
    Rake::Task["pull_data:census_poverty_2010"].execute
  end

  desc "Pull 2010 census poverty data and save to StatePovertyData model"
  task census_poverty_2010: :environment do
    puts "Pulling census poverty data..."
    puts "Data pulled! There are now #{StatePovertyData.where(year: 2010).count} records in the StatePovertyData model."
  end
end
