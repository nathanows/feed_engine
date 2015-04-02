class CreateStatePovertyData < ActiveRecord::Migration
  def change
    create_table :state_poverty_data do |t|
        t.integer :year
        t.integer :total_pop
        t.integer :population
        t.integer :population_below_poverty
        t.integer :male_below_poverty
        t.integer :male_below_poverty_under5
        t.integer :male_below_poverty_5
        t.integer :male_below_poverty_6to11
        t.integer :male_below_poverty_12to14
        t.integer :male_below_poverty_15
        t.integer :male_below_poverty_16to17
        t.integer :male_below_poverty_18to24
        t.integer :male_below_poverty_25to34
        t.integer :male_below_poverty_35to44
        t.integer :male_below_poverty_45to54
        t.integer :male_below_poverty_55to64
        t.integer :male_below_poverty_65to74
        t.integer :male_below_poverty_over75
        t.integer :female_below_poverty
        t.integer :female_below_poverty_under5
        t.integer :female_below_poverty_5
        t.integer :female_below_poverty_6to11
        t.integer :female_below_poverty_12to14
        t.integer :female_below_poverty_15
        t.integer :female_below_poverty_16to17
        t.integer :female_below_poverty_18to24
        t.integer :female_below_poverty_25to34
        t.integer :female_below_poverty_35to44
        t.integer :female_below_poverty_45to54
        t.integer :female_below_poverty_55to64
        t.integer :female_below_poverty_65to74
        t.integer :female_below_poverty_over75
        t.string  :state
    end
  end
end
