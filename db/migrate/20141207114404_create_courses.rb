class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name, null: false
      t.string :abbreviation, null: false
      t.references :institute, index: true

      t.timestamps null: false
    end
    add_index :courses, [:name, :institute_id], unique: true
    add_index :courses, [:abbreviation, :institute_id], unique: true
    add_foreign_key :courses, :institutes
  end
end
