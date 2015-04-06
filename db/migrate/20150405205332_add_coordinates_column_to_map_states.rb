class AddCoordinatesColumnToMapStates < ActiveRecord::Migration
  def change
    add_column :map_states, :geometry, :hstore
  end
end
