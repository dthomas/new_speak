class CreateTeachingAssignments < ActiveRecord::Migration
  def change
    create_table :teaching_assignments do |t|
      t.references :course_subject, index: true
      t.references :teacher, index: true
      t.references :class_group, index: true
      t.references :institute, index: true

      t.timestamps null: false
    end
    add_foreign_key :teaching_assignments, :course_subjects
    add_foreign_key :teaching_assignments, :teachers
    add_foreign_key :teaching_assignments, :class_groups
    add_foreign_key :teaching_assignments, :institutes
    add_index :teaching_assignments, [:course_subject_id, :teacher_id, :class_group_id, :institute_id], unique: true, name: :uniqe_subject_teacher_idx
  end
end
