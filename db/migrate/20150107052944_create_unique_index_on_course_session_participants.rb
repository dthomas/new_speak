class CreateUniqueIndexOnCourseSessionParticipants < ActiveRecord::Migration
  def change
  	remove_index :course_session_participants, :person_id
  	remove_index :course_session_participants, :course_session_id
  	remove_index :course_session_participants, :institute_id
  	add_index :course_session_participants, [:person_id, :course_session_id, :institute_id], unique: true, name: :unique_course_participant_idx
  end
end
