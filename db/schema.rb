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

ActiveRecord::Schema.define(version: 20141209035810) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "course_session_participants", force: true do |t|
    t.integer  "student_id"
    t.integer  "course_session_id"
    t.integer  "institute_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "course_session_participants", ["course_session_id"], name: "index_course_session_participants_on_course_session_id", using: :btree
  add_index "course_session_participants", ["institute_id"], name: "index_course_session_participants_on_institute_id", using: :btree
  add_index "course_session_participants", ["student_id"], name: "index_course_session_participants_on_student_id", using: :btree

  create_table "course_sessions", force: true do |t|
    t.string   "name",         null: false
    t.date     "start_date",   null: false
    t.date     "end_date",     null: false
    t.integer  "terms",        null: false
    t.integer  "current_term", null: false
    t.integer  "course_id"
    t.integer  "institute_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "course_sessions", ["course_id"], name: "index_course_sessions_on_course_id", using: :btree
  add_index "course_sessions", ["institute_id"], name: "index_course_sessions_on_institute_id", using: :btree
  add_index "course_sessions", ["name", "course_id", "institute_id"], name: "index_course_sessions_on_name_and_course_id_and_institute_id", unique: true, using: :btree

  create_table "courses", force: true do |t|
    t.string   "name",         null: false
    t.string   "abbreviation", null: false
    t.integer  "institute_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "courses", ["abbreviation", "institute_id"], name: "index_courses_on_abbreviation_and_institute_id", unique: true, using: :btree
  add_index "courses", ["institute_id"], name: "index_courses_on_institute_id", using: :btree
  add_index "courses", ["name", "institute_id"], name: "index_courses_on_name_and_institute_id", unique: true, using: :btree

  create_table "families", force: true do |t|
    t.string   "name",         null: false
    t.integer  "institute_id", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "families", ["institute_id"], name: "index_families_on_institute_id", using: :btree

  create_table "institutes", force: true do |t|
    t.string   "name",                              null: false
    t.string   "abbreviation",                      null: false
    t.string   "subdomain",                         null: false
    t.string   "phone",                             null: false
    t.string   "custom_domain"
    t.integer  "institute_type",        default: 0
    t.integer  "owner_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "last_admission_number", default: 1
    t.integer  "last_employee_number",  default: 1
  end

  add_index "institutes", ["custom_domain"], name: "index_institutes_on_custom_domain", unique: true, using: :btree
  add_index "institutes", ["owner_id"], name: "index_institutes_on_owner_id", using: :btree
  add_index "institutes", ["subdomain"], name: "index_institutes_on_subdomain", unique: true, using: :btree

  create_table "parents", force: true do |t|
    t.date     "wedding_anniversery"
    t.string   "relation",            null: false
    t.integer  "institute_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "family_id"
  end

  add_index "parents", ["family_id"], name: "index_parents_on_family_id", using: :btree
  add_index "parents", ["institute_id"], name: "index_parents_on_institute_id", using: :btree

  create_table "person_types", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "person_types", ["name"], name: "index_person_types_on_name", unique: true, using: :btree

  create_table "personal_profiles", force: true do |t|
    t.string   "first_name",       null: false
    t.string   "middle_name"
    t.string   "last_name",        null: false
    t.date     "date_of_birth",    null: false
    t.integer  "gender",           null: false
    t.integer  "institute_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "profileable_id"
    t.string   "profileable_type"
  end

  add_index "personal_profiles", ["institute_id"], name: "index_personal_profiles_on_institute_id", using: :btree
  add_index "personal_profiles", ["profileable_type", "profileable_id"], name: "index_personal_profiles_on_profileable_type_and_profileable_id", using: :btree

  create_table "students", force: true do |t|
    t.date     "date_of_admission", null: false
    t.date     "date_of_leaving",   null: false
    t.integer  "admission_number",  null: false
    t.integer  "user_id"
    t.integer  "institute_id",      null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "family_id"
  end

  add_index "students", ["family_id"], name: "index_students_on_family_id", using: :btree
  add_index "students", ["institute_id"], name: "index_students_on_institute_id", using: :btree
  add_index "students", ["user_id"], name: "index_students_on_user_id", using: :btree

  create_table "teachers", force: true do |t|
    t.date     "date_of_joining"
    t.date     "date_of_leaving"
    t.integer  "employee_number"
    t.integer  "user_id"
    t.integer  "institute_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "family_id"
  end

  add_index "teachers", ["family_id"], name: "index_teachers_on_family_id", using: :btree
  add_index "teachers", ["institute_id"], name: "index_teachers_on_institute_id", using: :btree
  add_index "teachers", ["user_id"], name: "index_teachers_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.integer  "institute_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email", "institute_id"], name: "index_users_on_email_and_institute_id", unique: true, using: :btree
  add_index "users", ["institute_id"], name: "index_users_on_institute_id", using: :btree

  add_foreign_key "course_session_participants", "course_sessions"
  add_foreign_key "course_session_participants", "institutes"
  add_foreign_key "course_session_participants", "students"
  add_foreign_key "course_sessions", "courses"
  add_foreign_key "course_sessions", "institutes"
  add_foreign_key "courses", "institutes"
  add_foreign_key "families", "institutes"
  add_foreign_key "parents", "families"
  add_foreign_key "parents", "institutes"
  add_foreign_key "personal_profiles", "institutes"
  add_foreign_key "students", "families"
  add_foreign_key "students", "institutes"
  add_foreign_key "students", "users"
  add_foreign_key "teachers", "families"
  add_foreign_key "teachers", "institutes"
  add_foreign_key "teachers", "users"
  add_foreign_key "users", "institutes"
end
