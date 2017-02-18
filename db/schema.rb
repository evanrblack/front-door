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

ActiveRecord::Schema.define(version: 20170217060223) do

  create_table "listings", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "agent_id"
    t.string   "street_address"
    t.string   "extra_address"
    t.string   "city",                 null: false
    t.string   "state",                null: false
    t.string   "zip_code",             null: false
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "property_type"
    t.integer  "bedrooms"
    t.integer  "full_bathrooms"
    t.integer  "half_bathrooms"
    t.integer  "square_feet"
    t.integer  "year_built"
    t.integer  "asking_price"
    t.text     "description"
    t.text     "showing_instructions"
    t.string   "mls_number"
    t.string   "mls_association"
    t.datetime "listed_at"
    t.integer  "sales_price"
    t.datetime "sold_at"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["agent_id"], name: "index_listings_on_agent_id"
    t.index ["client_id"], name: "index_listings_on_client_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "type",                                null: false
    t.string   "first_name",                          null: false
    t.string   "last_name",                           null: false
    t.string   "phone_number",                        null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
