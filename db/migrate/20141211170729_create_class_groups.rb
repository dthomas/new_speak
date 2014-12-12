class CreateClassGroups < ActiveRecord::Migration
  def change
    create_table :class_groups do |t|
      t.string :name, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.references :course_session, index: true
      t.references :institute, index: true

      t.timestamps null: false
    end
    add_index :class_groups, [:name, :course_session_id, :institute_id], unique: true, name: :unique_class_group_idx
    add_foreign_key :class_groups, :course_sessions
    add_foreign_key :class_groups, :institutes
  end
end
