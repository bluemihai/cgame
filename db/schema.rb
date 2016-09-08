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

ActiveRecord::Schema.define(version: 20160907221457) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "wild_card_weight"
    t.string   "image_url"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.boolean  "main",             default: false
    t.boolean  "active",           default: true
    t.text     "haiku"
  end

  create_table "games", force: :cascade do |t|
    t.datetime "starting"
    t.datetime "ending"
    t.integer  "location_id"
    t.integer  "host_id"
    t.string   "facebook_event_url"
    t.text     "review"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "cohost_id"
  end

  create_table "haikus", force: :cascade do |t|
    t.integer  "author_id"
    t.integer  "activity_id"
    t.string   "activity_name"
    t.text     "content"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "menu_items", force: :cascade do |t|
    t.integer  "activity_id"
    t.integer  "game_id"
    t.integer  "times_chosen"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "rsvps", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.boolean  "attended"
    t.integer  "rsvp_method"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "role"
    t.string   "email"
    t.text     "prefs"
    t.string   "facebook_id"
  end

end
