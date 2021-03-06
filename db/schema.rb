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

ActiveRecord::Schema.define(version: 20160314175051) do

  create_table "charges", force: :cascade do |t|
    t.string   "year"
    t.string   "month"
    t.integer  "amount"
    t.integer  "confirmation_num"
    t.integer  "parent_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "date"
    t.integer  "child_id"
    t.string   "authenticity_token"
    t.string   "stripeToken"
    t.boolean  "payed",              default: false
  end

  create_table "children", force: :cascade do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "parents_names"
    t.string   "gender"
    t.integer  "room_id"
    t.string   "parent1_number"
    t.string   "parent2_number"
    t.string   "medications_sensitivity"
    t.string   "city"
    t.string   "address"
    t.string   "email"
    t.datetime "dob"
    t.boolean  "attend",                  default: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "attached_file"
    t.string   "parent_id"
    t.integer  "tuition"
  end

  create_table "infos", force: :cascade do |t|
    t.integer  "child_id"
    t.string   "diaper_m"
    t.string   "diaper_n"
    t.string   "diaper_a"
    t.string   "breakfast"
    t.string   "lunch"
    t.string   "afternoon"
    t.string   "general"
    t.string   "sleep_time"
    t.boolean  "more_daiper",  default: false
    t.boolean  "more_wipes",   default: false
    t.boolean  "more_clothes", default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "parents", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.string   "last_name"
    t.string   "phone_number1"
    t.string   "phone_number2"
    t.string   "address"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "registrations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "tuition"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "room_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "provider"
    t.string   "user_type",  default: "u"
  end

end
