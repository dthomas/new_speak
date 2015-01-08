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

ActiveRecord::Schema.define(version: 20150108181310) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "academic_terms", force: :cascade do |t|
    t.string   "title",                    null: false
    t.string   "code",                     null: false
    t.integer  "course_id"
    t.integer  "institute_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "term_type",    default: 0
    t.integer  "term_class"
  end

  add_index "academic_terms", ["code", "course_id", "institute_id"], name: "index_academic_terms_on_code_and_course_id_and_institute_id", unique: true, using: :btree
  add_index "academic_terms", ["course_id"], name: "index_academic_terms_on_course_id", using: :btree
  add_index "academic_terms", ["institute_id"], name: "index_academic_terms_on_institute_id", using: :btree
  add_index "academic_terms", ["term_class", "course_id", "institute_id"], name: "unique_term_per_course_idx", unique: true, using: :btree
  add_index "academic_terms", ["title", "course_id", "institute_id"], name: "index_academic_terms_on_title_and_course_id_and_institute_id", unique: true, using: :btree

  create_table "assessment_results", force: :cascade do |t|
    t.decimal  "marks_obtained", null: false
    t.string   "grade"
    t.integer  "assessment_id"
    t.integer  "institute_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.decimal  "grade_point"
    t.integer  "student_id"
  end

  create_table "assessments", force: :cascade do |t|
    t.string   "title",                                null: false
    t.text     "description",                          null: false
    t.decimal  "weightage",              default: 0.0
    t.decimal  "maximum_marks",          default: 0.0
    t.integer  "strategy",               default: 0
    t.date     "due_date",                             null: false
    t.integer  "teaching_assignment_id"
    t.integer  "institute_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "assessments", ["institute_id"], name: "index_assessments_on_institute_id", using: :btree
  add_index "assessments", ["teaching_assignment_id"], name: "index_assessments_on_teaching_assignment_id", using: :btree
  add_index "assessments", ["title", "teaching_assignment_id"], name: "index_assessments_on_title_and_teaching_assignment_id", unique: true, using: :btree

  create_table "class_group_students", force: :cascade do |t|
    t.integer  "class_group_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "student_id"
  end

  create_table "class_groups", force: :cascade do |t|
    t.string   "name",              null: false
    t.date     "start_date",        null: false
    t.date     "end_date",          null: false
    t.integer  "course_session_id"
    t.integer  "institute_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "term_class"
    t.integer  "class_teacher_id"
  end

  add_index "class_groups", ["course_session_id"], name: "index_class_groups_on_course_session_id", using: :btree
  add_index "class_groups", ["institute_id"], name: "index_class_groups_on_institute_id", using: :btree
  add_index "class_groups", ["name", "course_session_id", "institute_id"], name: "unique_class_group_idx", unique: true, using: :btree

  create_table "course_session_participants", force: :cascade do |t|
    t.integer  "course_session_id"
    t.integer  "institute_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "student_id"
  end

  create_table "course_sessions", force: :cascade do |t|
    t.string   "name",                           null: false
    t.date     "start_date",                     null: false
    t.date     "end_date",                       null: false
    t.integer  "course_id"
    t.integer  "institute_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "admissions_open", default: true
    t.integer  "current_term_id"
  end

  add_index "course_sessions", ["course_id"], name: "index_course_sessions_on_course_id", using: :btree
  add_index "course_sessions", ["current_term_id"], name: "index_course_sessions_on_current_term_id", using: :btree
  add_index "course_sessions", ["institute_id"], name: "index_course_sessions_on_institute_id", using: :btree
  add_index "course_sessions", ["name", "course_id", "institute_id"], name: "index_course_sessions_on_name_and_course_id_and_institute_id", unique: true, using: :btree

  create_table "course_subjects", force: :cascade do |t|
    t.string   "title",                           null: false
    t.string   "code",                            null: false
    t.integer  "teaching_hours",                  null: false
    t.decimal  "weightage"
    t.decimal  "grade_points"
    t.boolean  "active",           default: true
    t.integer  "academic_term_id"
    t.integer  "institute_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "course_subjects", ["academic_term_id"], name: "index_course_subjects_on_academic_term_id", using: :btree
  add_index "course_subjects", ["code", "academic_term_id", "institute_id"], name: "uniqe_subject_code_idx", unique: true, using: :btree
  add_index "course_subjects", ["institute_id"], name: "index_course_subjects_on_institute_id", using: :btree
  add_index "course_subjects", ["title", "academic_term_id", "institute_id"], name: "uniqe_subject_title_idx", unique: true, using: :btree

  create_table "courses", force: :cascade do |t|
    t.string   "name",         null: false
    t.string   "abbreviation", null: false
    t.integer  "institute_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "courses", ["abbreviation", "institute_id"], name: "index_courses_on_abbreviation_and_institute_id", unique: true, using: :btree
  add_index "courses", ["institute_id"], name: "index_courses_on_institute_id", using: :btree
  add_index "courses", ["name", "institute_id"], name: "index_courses_on_name_and_institute_id", unique: true, using: :btree

  create_table "families", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "person_id"
    t.integer  "relative_id"
  end

  add_index "families", ["person_id"], name: "index_families_on_person_id", using: :btree
  add_index "families", ["relative_id"], name: "index_families_on_relative_id", using: :btree

  create_table "institutes", force: :cascade do |t|
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

  create_table "people", force: :cascade do |t|
    t.string   "first_name",                   null: false
    t.string   "middle_name"
    t.string   "last_name",                    null: false
    t.date     "date_of_birth",                null: false
    t.integer  "gender",                       null: false
    t.integer  "role",            default: 0
    t.hstore   "profile",         default: {}
    t.string   "email"
    t.string   "password_digest"
    t.integer  "institute_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "people", ["email", "institute_id"], name: "index_people_on_email_and_institute_id", unique: true, using: :btree
  add_index "people", ["email", "password_digest", "institute_id"], name: "index_people_on_email_and_password_digest_and_institute_id", using: :btree
  add_index "people", ["institute_id"], name: "index_people_on_institute_id", using: :btree
  add_index "people", ["profile"], name: "index_people_on_profile", using: :gin

  create_table "task_results", force: :cascade do |t|
    t.decimal  "marks_obtained",       null: false
    t.integer  "task_id"
    t.integer  "assessment_result_id"
    t.integer  "institute_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "student_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "name",          null: false
    t.text     "description",   null: false
    t.decimal  "maximum_marks", null: false
    t.decimal  "weightage",     null: false
    t.date     "due_date",      null: false
    t.integer  "assessment_id"
    t.integer  "institute_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "tasks", ["assessment_id"], name: "index_tasks_on_assessment_id", using: :btree
  add_index "tasks", ["institute_id"], name: "index_tasks_on_institute_id", using: :btree
  add_index "tasks", ["name", "assessment_id"], name: "index_tasks_on_name_and_assessment_id", unique: true, using: :btree

  create_table "teaching_assignments", force: :cascade do |t|
    t.integer  "course_subject_id"
    t.integer  "class_group_id"
    t.integer  "institute_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "teacher_id"
  end

  add_foreign_key "academic_terms", "courses"
  add_foreign_key "academic_terms", "institutes"
  add_foreign_key "assessment_results", "assessments"
  add_foreign_key "assessment_results", "institutes"
  add_foreign_key "assessment_results", "people", column: "student_id"
  add_foreign_key "assessments", "institutes"
  add_foreign_key "assessments", "teaching_assignments"
  add_foreign_key "class_group_students", "class_groups"
  add_foreign_key "class_group_students", "people", column: "student_id"
  add_foreign_key "class_groups", "course_sessions"
  add_foreign_key "class_groups", "institutes"
  add_foreign_key "class_groups", "people", column: "class_teacher_id"
  add_foreign_key "course_session_participants", "course_sessions"
  add_foreign_key "course_session_participants", "institutes"
  add_foreign_key "course_session_participants", "people", column: "student_id"
  add_foreign_key "course_sessions", "courses"
  add_foreign_key "course_sessions", "institutes"
  add_foreign_key "course_subjects", "academic_terms"
  add_foreign_key "course_subjects", "institutes"
  add_foreign_key "courses", "institutes"
  add_foreign_key "institutes", "people", column: "owner_id"
  add_foreign_key "people", "institutes"
  add_foreign_key "task_results", "assessment_results"
  add_foreign_key "task_results", "institutes"
  add_foreign_key "task_results", "people", column: "student_id"
  add_foreign_key "task_results", "tasks"
  add_foreign_key "tasks", "assessments"
  add_foreign_key "tasks", "institutes"
  add_foreign_key "teaching_assignments", "class_groups"
  add_foreign_key "teaching_assignments", "course_subjects"
  add_foreign_key "teaching_assignments", "institutes"
  add_foreign_key "teaching_assignments", "people", column: "teacher_id"
end
