class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.date :date_of_joining
      t.date :date_of_leaving
      t.integer :employee_number
      t.references :user, index: true
      t.references :person, index: true
      t.references :institute, index: true

      t.timestamps null: false
    end
    add_foreign_key :teachers, :users
    add_foreign_key :teachers, :people
    add_foreign_key :teachers, :institutes
  end
end
