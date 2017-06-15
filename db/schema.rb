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

ActiveRecord::Schema.define(version: 20170615140546) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "neighborhoods", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "restaurant_categories", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.integer  "category_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["category_id"], name: "index_restaurant_categories_on_category_id", using: :btree
    t.index ["restaurant_id"], name: "index_restaurant_categories_on_restaurant_id", using: :btree
  end

  create_table "restaurant_neighborhoods", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.integer  "neighborhood_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["neighborhood_id"], name: "index_restaurant_neighborhoods_on_neighborhood_id", using: :btree
    t.index ["restaurant_id"], name: "index_restaurant_neighborhoods_on_restaurant_id", using: :btree
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "phone"
    t.integer  "price"
    t.boolean  "takeout"
    t.boolean  "delivery"
    t.string   "website"
    t.string   "yelp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "restaurant_categories", "categories"
  add_foreign_key "restaurant_categories", "restaurants"
  add_foreign_key "restaurant_neighborhoods", "neighborhoods"
  add_foreign_key "restaurant_neighborhoods", "restaurants"
end
