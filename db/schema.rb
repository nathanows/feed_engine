# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150406192854) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "state_commute_time_data", force: :cascade do |t|
    t.integer "total_commuting_workers"
    t.integer "commuting_60_to_89_min"
    t.integer "commuting_over_89_min"
    t.string  "state"
  end

  create_table "state_migration_data", force: :cascade do |t|
    t.integer "year"
    t.string  "median_age"
    t.string  "same_house_1_year_ago"
    t.string  "moved_within_the_same_county"
    t.string  "moved_from_different_county_within_same_state"
    t.string  "moved_from_different_state"
    t.string  "moved_from_abroad"
    t.string  "state"
  end

  create_table "state_poverty_data", force: :cascade do |t|
    t.integer "year"
    t.integer "population"
    t.integer "population_below_poverty"
    t.integer "male_below_poverty"
    t.integer "male_below_poverty_under5"
    t.integer "male_below_poverty_5"
    t.integer "male_below_poverty_6to11"
    t.integer "male_below_poverty_12to14"
    t.integer "male_below_poverty_15"
    t.integer "male_below_poverty_16to17"
    t.integer "male_below_poverty_18to24"
    t.integer "male_below_poverty_25to34"
    t.integer "male_below_poverty_35to44"
    t.integer "male_below_poverty_45to54"
    t.integer "male_below_poverty_55to64"
    t.integer "male_below_poverty_65to74"
    t.integer "male_below_poverty_over75"
    t.integer "female_below_poverty"
    t.integer "female_below_poverty_under5"
    t.integer "female_below_poverty_5"
    t.integer "female_below_poverty_6to11"
    t.integer "female_below_poverty_12to14"
    t.integer "female_below_poverty_15"
    t.integer "female_below_poverty_16to17"
    t.integer "female_below_poverty_18to24"
    t.integer "female_below_poverty_25to34"
    t.integer "female_below_poverty_35to44"
    t.integer "female_below_poverty_45to54"
    t.integer "female_below_poverty_55to64"
    t.integer "female_below_poverty_65to74"
    t.integer "female_below_poverty_over75"
    t.string  "state"
  end

end
