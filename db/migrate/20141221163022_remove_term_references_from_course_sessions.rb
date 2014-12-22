class RemoveTermReferencesFromCourseSessions < ActiveRecord::Migration
  def change
    remove_column :course_sessions, :terms, :integer
    remove_column :course_sessions, :current_term, :integer
  end
end
