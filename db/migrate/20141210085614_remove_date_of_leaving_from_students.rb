class RemoveDateOfLeavingFromStudents < ActiveRecord::Migration
  def change
    remove_column :students, :date_of_leaving, :date
    add_column :students, :date_of_leaving, :date
  end
end
