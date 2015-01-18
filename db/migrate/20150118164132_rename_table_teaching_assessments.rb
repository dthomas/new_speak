class RenameTableTeachingAssessments < ActiveRecord::Migration
  def change
  	rename_table :teaching_assignments, :tutorials
  	rename_column :assessments, :teaching_assignment_id, :tutorial_id
  end
end
