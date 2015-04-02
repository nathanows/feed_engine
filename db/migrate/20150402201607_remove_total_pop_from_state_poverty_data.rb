class RemoveTotalPopFromStatePovertyData < ActiveRecord::Migration
  def change
    remove_column :state_poverty_data, :total_pop
  end
end
