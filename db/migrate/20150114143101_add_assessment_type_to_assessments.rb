class AddAssessmentTypeToAssessments < ActiveRecord::Migration
  def change
    add_column :assessments, :assessment_type, :integer, default: 0
  end
end
