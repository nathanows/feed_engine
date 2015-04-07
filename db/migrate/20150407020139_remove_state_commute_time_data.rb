class RemoveStateCommuteTimeData < ActiveRecord::Migration
  def change
    drop_table :state_commute_time_data
  end
end
