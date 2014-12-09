class RenamePeopleToPersonalProfiles < ActiveRecord::Migration
  def change
  	rename_table :people, :personal_profiles
  end
end
