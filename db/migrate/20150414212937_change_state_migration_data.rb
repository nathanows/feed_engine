class ChangeStateMigrationData < ActiveRecord::Migration
  def change
    change_table :state_migration_data do |t|
      t.change  :median_age, 'float USING CAST(median_age AS float)'
      t.change  :same_house_1_year_ago, 'float USING CAST(median_age AS float)'
      t.change  :moved_within_the_same_county, 'float USING CAST(median_age AS float)'
      t.change  :moved_from_different_county_within_same_state, 'float USING CAST(median_age AS float)'
      t.change  :moved_from_different_state, 'float USING CAST(median_age AS float)'
      t.change  :moved_from_abroad, 'float USING CAST(median_age AS float)'
    end
  end
end
