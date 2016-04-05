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

ActiveRecord::Schema.define(version: 20160405175900) do

  create_table "actions", force: :cascade do |t|
    t.string   "message"
    t.string   "location"
    t.datetime "expiration"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "user_id"
    t.string   "social_username", default: "unset"
    t.string   "action_type"
  end

  add_index "actions", ["social_username"], name: "index_actions_on_social_username"

  create_table "destinations", force: :cascade do |t|
    t.string  "name"
    t.string  "address"
    t.decimal "distance"
    t.string  "estimate_time"
    t.integer "action_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string   "handle"
    t.string   "content"
    t.datetime "when"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "handle"
    t.string   "content"
    t.datetime "when"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "socialuname"
    t.string   "socialpwd"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["socialuname"], name: "index_users_on_socialuname", unique: true

end
