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

ActiveRecord::Schema.define(version: 20160615133222) do

  create_table "deals", force: :cascade do |t|
    t.date     "date"
    t.decimal  "price"
    t.integer  "males"
    t.integer  "females"
    t.float    "live_weight"
    t.float    "dead_weight"
    t.string   "deal_type"
    t.string   "reason"
    t.integer  "partner_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "deals", ["partner_id"], name: "index_deals_on_partner_id"

  create_table "inventories", force: :cascade do |t|
    t.integer  "males"
    t.integer  "females"
    t.integer  "singleton_guard"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "inventories", ["singleton_guard"], name: "index_inventories_on_singleton_guard", unique: true

  create_table "invetory_changes", force: :cascade do |t|
    t.date     "date"
    t.integer  "amount_male"
    t.integer  "amount_female"
    t.integer  "changeable_id"
    t.string   "changeable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "invetory_changes", ["changeable_type", "changeable_id"], name: "index_invetory_changes_on_changeable_type_and_changeable_id"

  create_table "others", force: :cascade do |t|
    t.string   "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "partners", force: :cascade do |t|
    t.string   "name"
    t.string   "contact"
    t.integer  "deals_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "partners", ["deals_id"], name: "index_partners_on_deals_id"

  create_table "people", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
