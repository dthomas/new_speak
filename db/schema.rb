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

ActiveRecord::Schema.define(version: 20150104150149) do

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
    t.integer  "student_id"
    t.integer  "assessment_id"
    t.integer  "institute_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.decimal  "grade_point"
  end

  add_index "assessment_results", ["assessment_id"], name: "index_assessment_results_on_assessment_id", using: :btree
  add_index "assessment_results", ["institute_id"], name: "index_assessment_results_on_institute_id", using: :btree
  add_index "assessment_results", ["student_id", "assessment_id", "institute_id"], name: "unique_assessment_result_idx", unique: true, using: :btree
  add_index "assessment_results", ["student_id"], name: "index_assessment_results_on_student_id", using: :btree

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
    t.integer  "student_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "class_group_students", ["class_group_id"], name: "index_class_group_students_on_class_group_id", using: :btree
  add_index "class_group_students", ["student_id", "class_group_id"], name: "unique_class_group_students_idx", unique: true, using: :btree
  add_index "class_group_students", ["student_id"], name: "index_class_group_students_on_student_id", using: :btree

  create_table "class_groups", force: :cascade do |t|
    t.string   "name",              null: false
    t.date     "start_date",        null: false
    t.date     "end_date",          null: false
    t.integer  "course_session_id"
    t.integer  "institute_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "term_class"
  end

  add_index "class_groups", ["course_session_id"], name: "index_class_groups_on_course_session_id", using: :btree
  add_index "class_groups", ["institute_id"], name: "index_class_groups_on_institute_id", using: :btree
  add_index "class_groups", ["name", "course_session_id", "institute_id"], name: "unique_class_group_idx", unique: true, using: :btree

  create_table "course_session_participants", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "course_session_id"
    t.integer  "institute_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "course_session_participants", ["course_session_id"], name: "index_course_session_participants_on_course_session_id", using: :btree
  add_index "course_session_participants", ["institute_id"], name: "index_course_session_participants_on_institute_id", using: :btree
  add_index "course_session_participants", ["student_id"], name: "index_course_session_participants_on_student_id", using: :btree

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
    t.string   "name",         null: false
    t.integer  "institute_id", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "families", ["institute_id"], name: "index_families_on_institute_id", using: :btree

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

  create_table "parents", force: :cascade do |t|
    t.string   "relation",     null: false
    t.integer  "institute_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "family_id"
    t.string   "occupation"
  end

  add_index "parents", ["family_id"], name: "index_parents_on_family_id", using: :btree
  add_index "parents", ["institute_id"], name: "index_parents_on_institute_id", using: :btree

  create_table "person_types", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "person_types", ["name"], name: "index_person_types_on_name", unique: true, using: :btree

  create_table "personal_profiles", force: :cascade do |t|
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

  create_table "students", force: :cascade do |t|
    t.date     "date_of_admission", null: false
    t.integer  "admission_number",  null: false
    t.integer  "institute_id",      null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "family_id"
    t.date     "date_of_leaving"
  end

  add_index "students", ["family_id"], name: "index_students_on_family_id", using: :btree
  add_index "students", ["institute_id"], name: "index_students_on_institute_id", using: :btree

  create_table "task_results", force: :cascade do |t|
    t.decimal  "marks_obtained",       null: false
    t.integer  "task_id"
    t.integer  "assessment_result_id"
    t.integer  "student_id"
    t.integer  "institute_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "task_results", ["assessment_result_id"], name: "index_task_results_on_assessment_result_id", using: :btree
  add_index "task_results", ["institute_id"], name: "index_task_results_on_institute_id", using: :btree
  add_index "task_results", ["student_id", "task_id", "assessment_result_id"], name: "unique_task_result_idx", unique: true, using: :btree
  add_index "task_results", ["student_id"], name: "index_task_results_on_student_id", using: :btree
  add_index "task_results", ["task_id"], name: "index_task_results_on_task_id", using: :btree

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

  create_table "teachers", force: :cascade do |t|
    t.date     "date_of_joining"
    t.date     "date_of_leaving"
    t.integer  "employee_number"
    t.integer  "institute_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "family_id"
  end

  add_index "teachers", ["family_id"], name: "index_teachers_on_family_id", using: :btree
  add_index "teachers", ["institute_id"], name: "index_teachers_on_institute_id", using: :btree

  create_table "teaching_assignments", force: :cascade do |t|
    t.integer  "course_subject_id"
    t.integer  "teacher_id"
    t.integer  "class_group_id"
    t.integer  "institute_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "teaching_assignments", ["class_group_id"], name: "index_teaching_assignments_on_class_group_id", using: :btree
  add_index "teaching_assignments", ["course_subject_id", "teacher_id", "class_group_id", "institute_id"], name: "uniqe_subject_teacher_idx", unique: true, using: :btree
  add_index "teaching_assignments", ["course_subject_id"], name: "index_teaching_assignments_on_course_subject_id", using: :btree
  add_index "teaching_assignments", ["institute_id"], name: "index_teaching_assignments_on_institute_id", using: :btree
  add_index "teaching_assignments", ["teacher_id"], name: "index_teaching_assignments_on_teacher_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.integer  "institute_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "loginable_id"
    t.string   "loginable_type"
  end

  add_index "users", ["email", "institute_id"], name: "index_users_on_email_and_institute_id", unique: true, using: :btree
  add_index "users", ["institute_id"], name: "index_users_on_institute_id", using: :btree
  add_index "users", ["loginable_type", "loginable_id"], name: "index_users_on_loginable_type_and_loginable_id", using: :btree

  add_foreign_key "academic_terms", "courses"
  add_foreign_key "academic_terms", "institutes"
  add_foreign_key "assessment_results", "assessments"
  add_foreign_key "assessment_results", "institutes"
  add_foreign_key "assessment_results", "students"
  add_foreign_key "assessments", "institutes"
  add_foreign_key "assessments", "teaching_assignments"
  add_foreign_key "class_group_students", "class_groups"
  add_foreign_key "class_group_students", "students"
  add_foreign_key "class_groups", "course_sessions"
  add_foreign_key "class_groups", "institutes"
  add_foreign_key "course_session_participants", "course_sessions"
  add_foreign_key "course_session_participants", "institutes"
  add_foreign_key "course_session_participants", "students"
  add_foreign_key "course_sessions", "courses"
  add_foreign_key "course_sessions", "institutes"
  add_foreign_key "course_subjects", "academic_terms"
  add_foreign_key "course_subjects", "institutes"
  add_foreign_key "courses", "institutes"
  add_foreign_key "families", "institutes"
  add_foreign_key "parents", "families"
  add_foreign_key "parents", "institutes"
  add_foreign_key "personal_profiles", "institutes"
  add_foreign_key "students", "families"
  add_foreign_key "students", "institutes"
  add_foreign_key "task_results", "assessment_results"
  add_foreign_key "task_results", "institutes"
  add_foreign_key "task_results", "students"
  add_foreign_key "task_results", "tasks"
  add_foreign_key "tasks", "assessments"
  add_foreign_key "tasks", "institutes"
  add_foreign_key "teachers", "families"
  add_foreign_key "teachers", "institutes"
  add_foreign_key "teaching_assignments", "class_groups"
  add_foreign_key "teaching_assignments", "course_subjects"
  add_foreign_key "teaching_assignments", "institutes"
  add_foreign_key "teaching_assignments", "teachers"
  add_foreign_key "users", "institutes"
end
