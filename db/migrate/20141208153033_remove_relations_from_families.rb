class RemoveRelationsFromFamilies < ActiveRecord::Migration
  def change
    remove_foreign_key :families, :students
    remove_foreign_key :families, :parents
    remove_reference :families, :student, index: true
    remove_reference :families, :parent, index: true
  end
end
