class CreateTaskResults < ActiveRecord::Migration
  def change
    create_table :task_results do |t|
      t.decimal :marks_obtained, null: false
      t.references :task, index: true
      t.references :assessment_result, index: true
      t.references :student, index: true
      t.references :institute, index: true

      t.timestamps null: false
    end
    add_index :task_results, [:student_id, :task_id, :assessment_result_id], unique: true, name: :unique_task_result_idx
    add_foreign_key :task_results, :tasks
    add_foreign_key :task_results, :assessment_results
    add_foreign_key :task_results, :students
    add_foreign_key :task_results, :institutes
  end
end
