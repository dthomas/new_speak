class AddTermClassToAcademicTerms < ActiveRecord::Migration
  def change
    add_column :academic_terms, :term_class, :integer
    add_index :academic_terms, [:term_class, :course_id, :institute_id], unique: true, name: :unique_term_per_course_idx
  end
end
