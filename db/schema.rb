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

ActiveRecord::Schema.define(version: 20140104073545) do

  create_table "ridership_datasets", force: true do |t|
    t.string   "description"
    t.date     "as_on"
    t.date     "ending_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ridership_details", force: true do |t|
    t.integer  "ridership_dataset_id"
    t.date     "month_beginning_on"
    t.integer  "stop_id"
    t.decimal  "boardings"
    t.decimal  "alightings"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ridership_route_details", force: true do |t|
    t.integer  "ridership_dataset_id"
    t.integer  "route_id"
    t.decimal  "total_boardings"
    t.decimal  "total_alightings"
    t.decimal  "median_boardings"
    t.decimal  "median_alightings"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "route_stops", force: true do |t|
    t.integer  "stop_id"
    t.integer  "route_id"
    t.integer  "ridership_dataset_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "routes", force: true do |t|
    t.string   "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stops", force: true do |t|
    t.integer  "number"
    t.integer  "on_street_id"
    t.integer  "cross_street_id"
    t.string   "daytype"
    t.decimal  "longitude"
    t.decimal  "latitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "streets", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
