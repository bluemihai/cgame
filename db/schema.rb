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

ActiveRecord::Schema.define(version: 20171103145146) do

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
    t.string   "initials"
    t.boolean  "basic"
    t.integer  "mildness"
  end

  create_table "charges", force: :cascade do |t|
    t.integer  "amount"
    t.integer  "container_id"
    t.integer  "user_id"
    t.text     "comment"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "container_commitments", force: :cascade do |t|
    t.integer  "container_id"
    t.integer  "user_id"
    t.string   "status"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "containers", force: :cascade do |t|
    t.string   "name"
    t.datetime "starting"
    t.integer  "weeks"
    t.integer  "location_id"
    t.integer  "host_id"
    t.integer  "cohost_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "status"
    t.integer  "weekday"
    t.text     "agreements"
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
    t.string   "decoration"
    t.string   "color"
    t.string   "name"
    t.integer  "status"
    t.integer  "container_id"
    t.integer  "container_weeks"
    t.text     "blurb"
  end

  create_table "groups", force: :cascade do |t|
    t.integer  "round_id"
    t.integer  "activity_id"
    t.boolean  "wild_card"
    t.string   "wc_interpretation"
    t.string   "wc_curation"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "instigator_id"
    t.string   "conditions"
    t.integer  "activity_secondary_id"
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
    t.integer  "haiku_id"
  end

  create_table "offerings", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "presenter"
    t.integer  "price_min"
    t.integer  "price_ideal"
    t.integer  "hours_min"
    t.integer  "hours_ideal"
    t.text     "other_logistics"
    t.text     "presenter_bio"
    t.integer  "creator_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "participations", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.integer  "rating"
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payola_affiliates", force: :cascade do |t|
    t.string   "code"
    t.string   "email"
    t.integer  "percent"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payola_coupons", force: :cascade do |t|
    t.string   "code"
    t.integer  "percent_off"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",      default: true
  end

  create_table "payola_sales", force: :cascade do |t|
    t.string   "email",                limit: 191
    t.string   "guid",                 limit: 191
    t.integer  "product_id"
    t.string   "product_type",         limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state"
    t.string   "stripe_id"
    t.string   "stripe_token"
    t.string   "card_last4"
    t.date     "card_expiration"
    t.string   "card_type"
    t.text     "error"
    t.integer  "amount"
    t.integer  "fee_amount"
    t.integer  "coupon_id"
    t.boolean  "opt_in"
    t.integer  "download_count"
    t.integer  "affiliate_id"
    t.text     "customer_address"
    t.text     "business_address"
    t.string   "stripe_customer_id",   limit: 191
    t.string   "currency"
    t.text     "signed_custom_fields"
    t.integer  "owner_id"
    t.string   "owner_type",           limit: 100
    t.index ["coupon_id"], name: "index_payola_sales_on_coupon_id", using: :btree
    t.index ["email"], name: "index_payola_sales_on_email", using: :btree
    t.index ["guid"], name: "index_payola_sales_on_guid", using: :btree
    t.index ["owner_id", "owner_type"], name: "index_payola_sales_on_owner_id_and_owner_type", using: :btree
    t.index ["product_id", "product_type"], name: "index_payola_sales_on_product", using: :btree
    t.index ["stripe_customer_id"], name: "index_payola_sales_on_stripe_customer_id", using: :btree
  end

  create_table "payola_stripe_webhooks", force: :cascade do |t|
    t.string   "stripe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payola_subscriptions", force: :cascade do |t|
    t.string   "plan_type"
    t.integer  "plan_id"
    t.datetime "start"
    t.string   "status"
    t.string   "owner_type"
    t.integer  "owner_id"
    t.string   "stripe_customer_id"
    t.boolean  "cancel_at_period_end"
    t.datetime "current_period_start"
    t.datetime "current_period_end"
    t.datetime "ended_at"
    t.datetime "trial_start"
    t.datetime "trial_end"
    t.datetime "canceled_at"
    t.integer  "quantity"
    t.string   "stripe_id"
    t.string   "stripe_token"
    t.string   "card_last4"
    t.date     "card_expiration"
    t.string   "card_type"
    t.text     "error"
    t.string   "state"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "currency"
    t.integer  "amount"
    t.string   "guid",                 limit: 191
    t.string   "stripe_status"
    t.integer  "affiliate_id"
    t.string   "coupon"
    t.text     "signed_custom_fields"
    t.text     "customer_address"
    t.text     "business_address"
    t.integer  "setup_fee"
    t.decimal  "tax_percent",                      precision: 4, scale: 2
    t.index ["guid"], name: "index_payola_subscriptions_on_guid", using: :btree
  end

  create_table "rounds", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "order"
    t.string   "method_split"
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
    t.string   "city"
    t.string   "area"
  end

end
