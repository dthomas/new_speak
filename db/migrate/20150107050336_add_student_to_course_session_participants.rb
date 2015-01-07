class AddStudentToCourseSessionParticipants < ActiveRecord::Migration
  def change
    remove_reference :course_session_participants, :student, index: true
    remove_foreign_key :course_session_participants, :students
    add_reference :course_session_participants, :person, index: true
    add_foreign_key :course_session_participants, :people
  end
end
