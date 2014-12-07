class CreateParents < ActiveRecord::Migration
  def change
    create_table :parents do |t|
      t.date :wedding_anniversery
      t.string :relation, null: false
      t.references :person, index: true
      t.references :institute, index: true

      t.timestamps null: false
    end
    add_foreign_key :parents, :people
    add_foreign_key :parents, :institutes
  end
end
