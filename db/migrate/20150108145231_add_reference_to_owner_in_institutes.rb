class AddReferenceToOwnerInInstitutes < ActiveRecord::Migration
  def change
    add_foreign_key :institutes, :people, column: :owner_id
  end
end
