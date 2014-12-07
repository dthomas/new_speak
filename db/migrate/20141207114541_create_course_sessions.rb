class CreateCourseSessions < ActiveRecord::Migration
  def change
    create_table :course_sessions do |t|
      t.string :name, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.integer :terms, null: false
      t.integer :current_term, null: false
      t.references :course, index: true
      t.references :institute, index: true

      t.timestamps null: false
    end
    add_index :course_sessions, [:name, :course_id,:institute_id], unique: true
    add_foreign_key :course_sessions, :courses
    add_foreign_key :course_sessions, :institutes
  end
end
