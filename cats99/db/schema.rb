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

ActiveRecord::Schema.define(version: 20140626002409) do

  create_table "cat_rental_requests", force: true do |t|
    t.integer  "cat_id",                                     null: false
    t.datetime "start_date", limit: 255,                     null: false
    t.datetime "end_date",   limit: 255,                     null: false
    t.string   "status",                 default: "PENDING"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cat_rental_requests", ["cat_id"], name: "index_cat_rental_requests_on_cat_id"

  create_table "cats", force: true do |t|
    t.integer  "age"
    t.string   "birth_date"
    t.string   "color"
    t.string   "name",       null: false
    t.string   "sex"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
