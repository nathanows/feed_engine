class CreateStateEducationData < ActiveRecord::Migration
  def change
    create_table :state_education_data do |t|
      t.integer :year
      t.integer :population
      t.integer :no_schooling_completed
      t.integer :regular_high_school_diploma
      t.integer :ged_or_alternative
      t.integer :bachelors_degree
      t.integer :masters_degree
      t.integer :professional_degree
      t.integer :doctorate_degree
      t.string  :state
    end
  end
end
