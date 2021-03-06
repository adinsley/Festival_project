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

ActiveRecord::Schema.define(version: 20160119162029) do

  create_table "bookings", force: :cascade do |t|
    t.integer  "performance_id"
    t.integer  "user_id"
    t.integer  "tickets"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "bookings", ["performance_id"], name: "index_bookings_on_performance_id"
  add_index "bookings", ["user_id"], name: "index_bookings_on_user_id"

  create_table "genres", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interests", force: :cascade do |t|
    t.integer  "genre_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "interests", ["genre_id"], name: "index_interests_on_genre_id"
  add_index "interests", ["user_id"], name: "index_interests_on_user_id"

  create_table "performances", force: :cascade do |t|
    t.integer  "genre_id"
    t.integer  "show_id"
    t.integer  "venue_id"
    t.integer  "price"
    t.string   "restrictions"
    t.string   "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.datetime "start"
    t.datetime "finish"
  end

  add_index "performances", ["genre_id"], name: "index_performances_on_genre_id"
  add_index "performances", ["show_id"], name: "index_performances_on_show_id"
  add_index "performances", ["venue_id"], name: "index_performances_on_venue_id"

  create_table "shows", force: :cascade do |t|
    t.string   "title"
    t.string   "image"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "link"
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
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "venues", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.string   "description"
    t.text     "loaction"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "link"
    t.integer  "capacity"
  end

end
