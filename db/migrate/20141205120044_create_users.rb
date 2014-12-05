class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.references :institute, index: true

      t.timestamps null: false
    end
    add_index :users, [:email, :institute_id], unique: true
    add_foreign_key :users, :institutes
  end
end
