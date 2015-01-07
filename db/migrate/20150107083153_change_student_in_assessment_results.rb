class ChangeStudentInAssessmentResults < ActiveRecord::Migration
  def change
  	remove_index :assessment_results, column: :student_id
  	remove_index :assessment_results, column: :assessment_id
  	remove_index :assessment_results, column: :institute_id
  	remove_index :assessment_results, column: [:student_id, :assessment_id, :institute_id], unique: true, name: :unique_assessment_result_idx
  	remove_reference :assessment_results, :student
  	add_reference :assessment_results, :person
  	add_foreign_key :assessment_results, :people
  	add_index :assessment_results, [:person_id, :assessment_id, :institute_id], unique: true, name: :unique_assessment_result_idx
  end
end
