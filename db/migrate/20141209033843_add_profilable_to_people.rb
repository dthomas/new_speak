class AddProfilableToPeople < ActiveRecord::Migration
  def change
    add_reference :people, :profileable, polymorphic: true, index: true
  end
end
