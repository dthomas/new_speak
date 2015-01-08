class RenameForeignKeysToReflectRelation < ActiveRecord::Migration
  def change
  	# remove_foreign_key :class_group_students, :people, column: :person_id
  	add_reference :class_group_students, :student
  	add_foreign_key :class_group_students, :people, column: :student_id
  	remove_reference :class_group_students, :person
  	remove_reference :class_groups, :person
  	remove_reference :task_results, :person
  	remove_reference :teaching_assignments, :person
  	remove_reference :assessment_results, :person
  	remove_reference :course_session_participants, :person
  	add_reference :class_groups, :class_teacher
  	add_foreign_key :class_groups, :people, column: :class_teacher_id
  	add_reference :task_results, :student
  	add_foreign_key :task_results, :people, column: :student_id
  	add_reference :teaching_assignments, :teacher
  	add_foreign_key :teaching_assignments, :people, column: :teacher_id
  	add_reference :assessment_results, :student
  	add_foreign_key :assessment_results, :people, column: :student_id
  	add_reference :course_session_participants, :student
  	add_foreign_key :course_session_participants, :people, column: :student_id
  end
end
