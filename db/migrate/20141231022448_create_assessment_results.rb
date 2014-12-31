class CreateAssessmentResults < ActiveRecord::Migration
  def change
    create_table :assessment_results do |t|
      t.decimal :marks_obtained, null: false
      t.string :grade
      t.references :student, index: true
      t.references :assessment, index: true
      t.references :institute, index: true

      t.timestamps null: false
    end
    add_index :assessment_results, [:student_id, :assessment_id, :institute_id], unique: true, name: :unique_assessment_result_idx
    add_foreign_key :assessment_results, :students
    add_foreign_key :assessment_results, :assessments
    add_foreign_key :assessment_results, :institutes
  end
end
