class ChangeClassTeacherInClassGroups < ActiveRecord::Migration
  def change
  	remove_index :class_groups, column: :class_teacher_id
  	remove_reference :class_groups, :class_teacher
  	add_reference :class_groups, :person, index: true
  	add_foreign_key :class_groups, :people
  end
end
