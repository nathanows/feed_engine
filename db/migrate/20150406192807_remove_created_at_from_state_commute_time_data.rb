class RemoveCreatedAtFromStateCommuteTimeData < ActiveRecord::Migration
  def change
    remove_column :state_commute_time_data, :created_at, :datetime
  end
end
