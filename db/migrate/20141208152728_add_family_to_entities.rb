class AddFamilyToEntities < ActiveRecord::Migration
  def change
    add_reference :students, :family, index: true
    add_reference :parents, :family, index: true
    add_reference :teachers, :family, index: true
    add_foreign_key :students, :families
    add_foreign_key :parents, :families
    add_foreign_key :teachers, :families
  end
end
