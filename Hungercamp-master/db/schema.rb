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

ActiveRecord::Schema.define(version: 20151119185113) do

  create_table "assignments", force: :cascade do |t|
    t.string   "name"
    t.date     "due_date"
    t.integer  "ruby_points"
    t.integer  "html_points"
    t.integer  "database_points"
    t.integer  "die_hours"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: :cascade do |t|
    t.integer "assignment_id"
    t.string  "question"
    t.boolean "answer"
    t.integer "difficulty"
  end

  create_table "responses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "assignment_id"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "photo_url"
    t.date     "start_date"
    t.datetime "time_of_death"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
