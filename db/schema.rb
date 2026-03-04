# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2026_03_04_192135) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "maintenance_tickets", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "status"
    t.decimal "budget"
    t.boolean "capex"
    t.bigint "property_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_maintenance_tickets_on_property_id"
  end

  create_table "opportunities", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.decimal "price"
    t.float "projected_roi"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "properties", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.decimal "purchase_price"
    t.decimal "current_value"
    t.float "occupancy_rate"
    t.decimal "monthly_net_income"
    t.float "airbnb_score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "city"
    t.integer "square_meters"
    t.string "coordinates"
    t.string "image_url"
  end

  add_foreign_key "maintenance_tickets", "properties"
end
