class CreateAssessments < ActiveRecord::Migration
  def change
    create_table :assessments do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.decimal :weightage, default: 0.0
      t.decimal :maximum_marks, default: 0.0
      t.integer :strategy, default: 0
      t.date  :due_date, null: false
      t.references :teaching_assignment, index: true
      t.references :institute, index: true

      t.timestamps null: false
    end
    add_index :assessments, [:title, :teaching_assignment_id], unique: true
    add_foreign_key :assessments, :teaching_assignments
    add_foreign_key :assessments, :institutes
  end
end
