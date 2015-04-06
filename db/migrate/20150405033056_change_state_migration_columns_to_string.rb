class ChangeStateMigrationColumnsToString < ActiveRecord::Migration
  def change
    change_table :state_migration_data do |t|
      t.change  :median_age, :string
      t.change  :same_house_1_year_ago, :string
      t.change  :moved_within_the_same_county, :string
      t.change  :moved_from_different_county_within_same_state, :string
      t.change  :moved_from_different_state, :string
      t.change  :moved_from_abroad, :string
    end
  end
end
