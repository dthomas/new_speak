class AddOccupationToParents < ActiveRecord::Migration
  def change
    add_column :parents, :occupation, :string
    remove_column :parents, :wedding_anniversery, :date
  end
end
