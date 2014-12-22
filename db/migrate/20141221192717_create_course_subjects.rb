class CreateCourseSubjects < ActiveRecord::Migration
  def change
    create_table :course_subjects do |t|
      t.string :title, null: false
      t.string :code, null: false
      t.integer :teaching_hours, null: false
      t.decimal :weightage
      t.decimal :grade_points
      t.boolean :active, default: true
      t.references :academic_term, index: true
      t.references :institute, index: true

      t.timestamps null: false
    end
    add_index :course_subjects, [:title, :academic_term_id, :institute_id], unique: true, name: :uniqe_subject_title_idx
    add_index :course_subjects, [:code, :academic_term_id, :institute_id], unique: true, name: :uniqe_subject_code_idx
    add_foreign_key :course_subjects, :academic_terms
    add_foreign_key :course_subjects, :institutes
  end
end
