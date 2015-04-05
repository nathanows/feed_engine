class CreateStateEducationData < ActiveRecord::Migration
  def change
    create_table :state_education_data do |t|

      t.timestamps null: false
    end
  end
end
