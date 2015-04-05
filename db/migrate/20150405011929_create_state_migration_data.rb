class CreateStateMigrationData < ActiveRecord::Migration
  def change
    create_table :state_migration_data do |t|
      t.integer :year
      t.integer :median_age
      t.integer :same_house_1_year_ago
      t.integer :moved_within_the_same_county
      t.integer :moved_from_different_county_within_same_state
      t.integer :moved_from_different_state
      t.integer :moved_from_abroad
      t.string  :state
    end
  end
end
