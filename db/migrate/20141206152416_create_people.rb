class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name, null: false
      t.string :middle_name
      t.string :last_name, null: false
      t.date :date_of_birth, null: false
      t.integer :gender, null: false
      t.references :person_type, index: true
      t.references :institute, index: true

      t.timestamps null: false
    end
    add_foreign_key :people, :person_types
    add_foreign_key :people, :institutes
    add_index :people, [:id, :person_type_id], unique: true
  end
end
