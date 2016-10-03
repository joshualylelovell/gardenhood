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

ActiveRecord::Schema.define(version: 20161003163114) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gardeners", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_gardeners_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_gardeners_on_reset_password_token", unique: true, using: :btree
  end

  create_table "requests", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.string   "notes"
    t.string   "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "gardener_id"
    t.integer  "tool_id"
    t.index ["gardener_id"], name: "index_requests_on_gardener_id", using: :btree
    t.index ["tool_id"], name: "index_requests_on_tool_id", using: :btree
  end

  create_table "tools", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "details",     null: false
    t.boolean  "requested"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "gardener_id"
    t.string   "image"
    t.index ["gardener_id"], name: "index_tools_on_gardener_id", using: :btree
  end

  add_foreign_key "requests", "gardeners"
  add_foreign_key "requests", "tools"
  add_foreign_key "tools", "gardeners"
end
