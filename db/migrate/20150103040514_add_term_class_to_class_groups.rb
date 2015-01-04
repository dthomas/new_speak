class AddTermClassToClassGroups < ActiveRecord::Migration
  def change
    add_column :class_groups, :term_class, :integer
  end
end
