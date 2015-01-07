class ChangeStudentInTaskResults < ActiveRecord::Migration
  def change
  	remove_index :task_results, column: [:student_id, :task_id, :assessment_result_id], name: :unique_task_result_idx, unique: true
  	remove_index :task_results, column: :assessment_result_id
  	remove_index :task_results, column: :task_id
  	remove_index :task_results, column: :student_id
  	remove_index :task_results, column: :institute_id
  	remove_reference :task_results, :student
  	add_reference :task_results, :person
  	add_foreign_key :task_results, :people
  	add_index :task_results, [:person_id, :task_id, :assessment_result_id, :institute_id], name: :unique_task_result_idx, unique: true
  end
end
