class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.string :name, null: false
      t.references :parent, index: true, null: false
      t.references :student, index: true, null: false
      t.references :institute, index: true, null: false

      t.timestamps null: false
    end
    add_foreign_key :families, :parents
    add_foreign_key :families, :students
    add_foreign_key :families, :institutes
  end
end
