class RemovePersonFromEntities < ActiveRecord::Migration
  def change
    remove_foreign_key :students, :people
    remove_foreign_key :parents, :people
    remove_foreign_key :teachers, :people
    remove_reference :students, :person, index: true
    remove_reference :parents, :person, index: true
    remove_reference :teachers, :person, index: true
  end
end
