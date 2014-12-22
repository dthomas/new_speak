class AddTermTypeToAcademicTerms < ActiveRecord::Migration
  def change
    add_column :academic_terms, :term_type, :integer, default: 0
  end
end
