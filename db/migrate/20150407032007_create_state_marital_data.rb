class CreateStateMaritalData < ActiveRecord::Migration
  def change
    create_table :state_marital_data do |t|
      t.integer :year
      t.integer :population
      t.integer :male_population
      t.integer :male_never_married
      t.integer :male_ever_married
      t.integer :male_ever_married_and_married_last_year
      t.integer :male_ever_married_and_not_married_last_year
      t.integer :female_population
      t.integer :female_never_married
      t.integer :female_ever_married
      t.integer :female_ever_married_and_married_last_year
      t.integer :female_ever_married_and_not_married_last_year
      t.string :state

      t.timestamps null: false
    end
  end
end
