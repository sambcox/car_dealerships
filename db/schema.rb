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

ActiveRecord::Schema.define(version: 2022_12_06_203333) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "name"
    t.boolean "available"
    t.integer "year"
    t.integer "mileage"
    t.string "color"
    t.string "vin"
    t.bigint "dealership_id"
    t.index ["dealership_id"], name: "index_cars_on_dealership_id"
  end

  create_table "dealerships", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "name"
    t.string "city"
    t.boolean "service_department"
    t.integer "employees"
    t.integer "cars_count"
  end

  add_foreign_key "cars", "dealerships"
end
