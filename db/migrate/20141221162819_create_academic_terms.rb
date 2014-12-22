class CreateAcademicTerms < ActiveRecord::Migration
  def change
    create_table :academic_terms do |t|
      t.string :title, null: false
      t.string :code, null: false
      t.references :course, index: true
      t.references :institute, index: true

      t.timestamps null: false
    end
    add_index :academic_terms, [:title, :course_id, :institute_id], unique: true
    add_index :academic_terms, [:code, :course_id, :institute_id], unique: true
    add_foreign_key :academic_terms, :courses
    add_foreign_key :academic_terms, :institutes
  end
end
