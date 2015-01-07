class ChangeStudentInClassGroupStudents < ActiveRecord::Migration
  def change
  	remove_index :class_group_students, column: :class_group_id
  	remove_index :class_group_students, column: :student_id
  	remove_index :class_group_students, column: [:student_id, :class_group_id], unique: true, name: :unique_class_group_students_idx
  	remove_reference :class_group_students, :student
  	add_reference :class_group_students, :person
  	add_foreign_key :class_group_students, :people
  	add_index :class_group_students, [:person_id, :class_group_id], unique: true, name: :unique_student_class_group_idx
  end
end
