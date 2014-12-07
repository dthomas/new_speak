class CreateCourseSessionParticipants < ActiveRecord::Migration
  def change
    create_table :course_session_participants do |t|
      t.references :student, index: true
      t.references :course_session, index: true
      t.references :institute, index: true

      t.timestamps null: false
    end
    add_foreign_key :course_session_participants, :students
    add_foreign_key :course_session_participants, :course_sessions
    add_foreign_key :course_session_participants, :institutes
  end
end
