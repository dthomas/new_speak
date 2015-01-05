class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name, null: false
      t.string :middle_name
      t.string :last_name, null: false
      t.date :date_of_birth, null: false
      t.integer :gender, null: false
      t.integer :person_type, default: 0
      t.hstore :profile, default: {}
      t.string :email
      t.string :password_digest
      t.references :family, index: true
      t.references :institute, index: true

      t.timestamps null: false
    end
    add_index :people, :profile, using: :gin
    add_index :people, [:email, :institute_id], unique: true
    add_index :people, [:email, :password_digest, :institute_id]
    add_foreign_key :people, :families
    add_foreign_key :people, :institutes
  end
end
