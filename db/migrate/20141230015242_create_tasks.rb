class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.decimal :maximum_marks, null: false
      t.decimal :weightage, null: false
      t.date :due_date, null: false
      t.references :assessment, index: true
      t.references :institute, index: true

      t.timestamps null: false
    end
    add_index :tasks, [:name, :assessment_id], unique: true
    add_foreign_key :tasks, :assessments
    add_foreign_key :tasks, :institutes
  end
end
