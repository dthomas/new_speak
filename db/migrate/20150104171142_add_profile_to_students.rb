class AddProfileToStudents < ActiveRecord::Migration
  def change
    add_column :students, :profile, :hstore, default: {}
    add_index :students, :profile, using: :gin
  end
end
