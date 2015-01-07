class ChangeTeacherInTeachingAssignments < ActiveRecord::Migration
  def change
  	remove_index :teaching_assignments, column: [:course_subject_id, :teacher_id, :class_group_id, :institute_id], unique: true, name: :uniqe_subject_teacher_idx
  	remove_index :teaching_assignments, column: :class_group_id
  	remove_index :teaching_assignments, column: :course_subject_id
  	remove_index :teaching_assignments, column: :teacher_id
  	remove_index :teaching_assignments, column: :institute_id

  	remove_reference :teaching_assignments, :teacher
  	add_reference :teaching_assignments, :person
  	add_foreign_key :teaching_assignments, :people
  	add_index :teaching_assignments, [:course_subject_id, :person_id, :class_group_id, :institute_id], name: :unique_subject_teacher_idx
  end
end
