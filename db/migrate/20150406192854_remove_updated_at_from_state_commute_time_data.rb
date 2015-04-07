class RemoveUpdatedAtFromStateCommuteTimeData < ActiveRecord::Migration
  def change
    remove_column :state_commute_time_data, :updated_at, :datetime
  end
end
