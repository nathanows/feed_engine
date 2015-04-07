class RemoveDateTimesFromStateMaritalData < ActiveRecord::Migration
  def change
    remove_column :state_marital_data, :created_at, :datetime
    remove_column :state_marital_data, :updated_at, :datetime
  end
end
