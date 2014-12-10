class AddAdmissionsOpenToCourseSessions < ActiveRecord::Migration
  def change
    add_column :course_sessions, :admissions_open, :boolean, default: true
  end
end
