class CreateClassGroupStudents < ActiveRecord::Migration
  def change
    create_table :class_group_students do |t|
      t.integer :roll_number
      t.references :class_group, index: true
      t.references :student, index: true
      t.references :institute, index: true

      t.timestamps null: false
    end
    
    add_index :class_group_students, [:student_id, :class_group_id, :institute_id], unique: true, name: :unique_class_group_students_idx
    add_index :class_group_students, [:roll_number, :class_group_id, :institute_id], unique: true, name: :unique_class_group_roll_number_idx
    add_foreign_key :class_group_students, :class_groups
    add_foreign_key :class_group_students, :students
    add_foreign_key :class_group_students, :institutes
  end
end
