class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.date :date_of_admission, null: false
      t.date :date_of_leaving, null: false
      t.integer :admission_number, null: false
      t.references :user, index: true
      t.references :person, index: true, null: false
      t.references :institute, index: true, null: false

      t.timestamps null: false
    end
    add_foreign_key :students, :users
    add_foreign_key :students, :people
    add_foreign_key :students, :institutes
  end
end
