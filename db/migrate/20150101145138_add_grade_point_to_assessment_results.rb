class AddGradePointToAssessmentResults < ActiveRecord::Migration
  def change
    add_column :assessment_results, :grade_point, :decimal
  end
end
