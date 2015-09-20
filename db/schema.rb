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

ActiveRecord::Schema.define(version: 20150920005444) do

  create_table "lesson_schedules", force: :cascade do |t|
    t.string   "start_time", limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "lesson_schedules", ["start_time"], name: "index_lesson_schedules_on_start_time", unique: true, using: :btree

  create_table "lessons", force: :cascade do |t|
    t.integer  "teacher_id",         limit: 4,                 null: false
    t.integer  "lesson_schedule_id", limit: 4,                 null: false
    t.integer  "student_id",         limit: 4
    t.boolean  "availability",                 default: false, null: false
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "lessons", ["teacher_id", "lesson_schedule_id"], name: "index_lessons_on_teacher_id_and_lesson_schedule_id", unique: true, using: :btree

  create_table "students", force: :cascade do |t|
    t.string   "email",      limit: 255, null: false
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "students", ["email"], name: "index_students_on_email", unique: true, using: :btree

  create_table "teachers", force: :cascade do |t|
    t.string   "email",      limit: 255, null: false
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "teachers", ["email"], name: "index_teachers_on_email", unique: true, using: :btree

end
