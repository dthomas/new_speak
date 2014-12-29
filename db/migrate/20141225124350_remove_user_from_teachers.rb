class RemoveUserFromTeachers < ActiveRecord::Migration
  def change
    remove_foreign_key :teachers, :users
    remove_foreign_key :students, :users
    remove_reference :teachers, :user, index: true
    remove_reference :students, :user, index: true
  end
end
