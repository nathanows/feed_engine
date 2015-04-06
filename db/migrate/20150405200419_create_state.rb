class CreateState < ActiveRecord::Migration
  def change
    create_table :map_states do |t|
      t.string :short_name
      t.string :name
      t.float :census_area
    end
  end
end
