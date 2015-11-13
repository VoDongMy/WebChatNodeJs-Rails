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

ActiveRecord::Schema.define(version: 20151112132626) do

  create_table "group_chats", force: :cascade do |t|
    t.string   "title",       limit: 255, default: "nil", null: false
    t.string   "user_id",     limit: 255, default: "0",   null: false
    t.string   "prent_id",    limit: 255, default: "0",   null: false
    t.string   "description", limit: 255, default: "nil", null: false
    t.integer  "status",      limit: 4,   default: 0,     null: false
    t.integer  "on_server",   limit: 4,   default: 0,     null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "group_users", force: :cascade do |t|
    t.string "title",      limit: 255,   default: "user", null: false
    t.text   "desription", limit: 65535
  end

  create_table "messengers", force: :cascade do |t|
    t.integer  "user_one",   limit: 4,                         null: false
    t.integer  "user_two",   limit: 4,     default: 0
    t.integer  "group_id",   limit: 4,     default: 0
    t.string   "title",      limit: 255,   default: "nil"
    t.text     "mess",       limit: 65535
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "ip",         limit: 255,   default: "0.0.0.0", null: false
  end

  create_table "reply_messengers", force: :cascade do |t|
    t.integer  "mess_id",    limit: 4,     null: false
    t.integer  "user_id",    limit: 4,     null: false
    t.text     "mess",       limit: 65535, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "user_group_chats", force: :cascade do |t|
    t.integer "group_id", limit: 4, default: 0
    t.integer "user_id",  limit: 4, default: 0
    t.integer "status",   limit: 4, default: 0
  end

  create_table "user_statuses", force: :cascade do |t|
    t.integer  "user_id",    limit: 4,   default: 0
    t.string   "socket_id",  limit: 255, default: "nil"
    t.integer  "status",     limit: 4,   default: 0,     null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "last_name",   limit: 255, default: ""
    t.string   "first_name",  limit: 255, default: "nil", null: false
    t.string   "email_login", limit: 255, default: "nil", null: false
    t.integer  "company_id",  limit: 4,   default: 0
    t.integer  "group_id",    limit: 4,   default: 0
    t.date     "birthday"
    t.string   "avatar",      limit: 255, default: "nil"
    t.string   "tell",        limit: 255, default: "nil"
    t.string   "google_id",   limit: 255, default: "nil"
    t.string   "password",    limit: 255,                 null: false
    t.string   "active_code", limit: 255, default: "nil"
    t.integer  "status",      limit: 4,                   null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

end
