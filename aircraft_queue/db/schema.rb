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

ActiveRecord::Schema.define(version: 20150828224440) do

  create_table "aircrafts", force: :cascade do |t|
    t.string   "flight_num"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "flight_type"
    t.string   "flight_size"
    t.integer  "flight_queue_id"
  end

  add_index "aircrafts", ["flight_queue_id"], name: "index_aircrafts_on_flight_queue_id"

  create_table "flight_queues", force: :cascade do |t|
    t.datetime "enqueued"
    t.integer  "aircraft_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "flight_queues", ["aircraft_id"], name: "index_flight_queues_on_aircraft_id"

end
