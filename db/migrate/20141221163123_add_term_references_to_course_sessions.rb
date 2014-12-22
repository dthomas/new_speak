class AddTermReferencesToCourseSessions < ActiveRecord::Migration
  def change
    add_reference :course_sessions, :current_term, index: true
    # add_foreign_key :course_sessions, :current_terms
  end
end
