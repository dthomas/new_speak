class RemoveUnnecessaryTables < ActiveRecord::Migration
  def change
  	drop_table :users
  	drop_table :teachers
  	drop_table :students
  	drop_table :personal_profiles
  	drop_table :person_types
  	drop_table :parents
  end
end
