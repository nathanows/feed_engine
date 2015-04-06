class CreateStateCommuteTimeData < ActiveRecord::Migration
  def change
    create_table :state_commute_time_data do |t|
      t.integer :total_commuting_workers
      t.integer :commuting_60_to_89_min
      t.integer :commuting_over_89_min
      t.string :state

      t.timestamps null: false
    end
  end
end
