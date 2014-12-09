class RemovePersonTypesFromPersonalProfiles < ActiveRecord::Migration
  def change
    remove_foreign_key :personal_profiles, :person_types
    remove_reference :personal_profiles, :person_type, index: true
  end
end
