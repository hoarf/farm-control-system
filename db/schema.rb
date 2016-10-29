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

ActiveRecord::Schema.define(version: 20161015005219) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.integer  "farm_id"
    t.integer  "parent_id"
    t.text     "description"
    t.decimal  "start",       default: 0.0
    t.string   "system_name"
    t.string   "type"
    t.string   "name"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "accounts", ["farm_id"], name: "index_accounts_on_farm_id", using: :btree
  add_index "accounts", ["parent_id"], name: "index_accounts_on_parent_id", using: :btree

  create_table "entries", force: :cascade do |t|
    t.integer  "inventory_id"
    t.integer  "fact_id"
    t.decimal  "amount"
    t.string   "type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "entries", ["fact_id"], name: "index_entries_on_fact_id", using: :btree
  add_index "entries", ["inventory_id"], name: "index_entries_on_inventory_id", using: :btree

  create_table "facts", force: :cascade do |t|
    t.date     "date"
    t.text     "description"
    t.integer  "partner_id"
    t.text     "evidence"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "facts", ["partner_id"], name: "index_facts_on_partner_id", using: :btree

  create_table "farms", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventories", force: :cascade do |t|
    t.string   "item"
    t.string   "system_name"
    t.text     "description"
    t.string   "type"
    t.string   "unit"
    t.integer  "farm_id"
    t.decimal  "initial_amount",  default: 0.0
    t.date     "date"
    t.decimal  "initial_balance", default: 0.0
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "inventories", ["farm_id"], name: "index_inventories_on_farm_id", using: :btree

  create_table "moves", force: :cascade do |t|
    t.integer  "account_id"
    t.string   "type"
    t.integer  "fact_id"
    t.decimal  "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "moves", ["account_id"], name: "index_moves_on_account_id", using: :btree
  add_index "moves", ["fact_id"], name: "index_moves_on_fact_id", using: :btree

  create_table "partners", force: :cascade do |t|
    t.string   "name"
    t.text     "contact"
    t.integer  "farm_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "partners", ["farm_id"], name: "index_partners_on_farm_id", using: :btree

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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "farm_id"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["farm_id"], name: "index_users_on_farm_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  add_foreign_key "accounts", "farms"
  add_foreign_key "entries", "facts"
  add_foreign_key "entries", "inventories"
  add_foreign_key "facts", "partners"
  add_foreign_key "inventories", "farms"
  add_foreign_key "moves", "accounts"
  add_foreign_key "moves", "facts"
  add_foreign_key "partners", "farms"
  add_foreign_key "users", "farms"
end
