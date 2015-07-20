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

ActiveRecord::Schema.define(version: 20150720182028) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "connections", force: :cascade do |t|
    t.integer  "user_id1",   null: false
    t.integer  "user_id2",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "connections", ["user_id1"], name: "index_connections_on_user_id1", using: :btree
  add_index "connections", ["user_id2"], name: "index_connections_on_user_id2", using: :btree

  create_table "experiences", force: :cascade do |t|
    t.integer "user_id"
    t.string  "title"
    t.string  "employer"
    t.text    "description"
    t.date    "start_date"
    t.date    "end_date"
    t.boolean "current",     default: false
  end

  add_index "experiences", ["user_id"], name: "index_experiences_on_user_id", using: :btree

  create_table "requests", force: :cascade do |t|
    t.integer  "sender_id",    null: false
    t.integer  "responder_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "requests", ["responder_id"], name: "index_requests_on_responder_id", using: :btree
  add_index "requests", ["sender_id"], name: "index_requests_on_sender_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string  "email",                           null: false
    t.string  "password_digest",                 null: false
    t.string  "fname",                           null: false
    t.string  "lname"
    t.string  "session_token"
    t.string  "title"
    t.string  "employer"
    t.text    "summary"
    t.string  "img_url"
    t.boolean "sample",          default: false
  end

end
