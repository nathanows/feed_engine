namespace :pull_data do
  task census_poverty_2010: :environment do
    puts "Pulling census poverty data..."
    CensusService.new.save_poverty_data(2010)
    puts "Census"
  end
end
