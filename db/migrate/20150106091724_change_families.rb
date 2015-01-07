class ChangeFamilies < ActiveRecord::Migration
  def change
  	remove_column :families, :name, :string
  	remove_reference :families, :institute
  	add_reference :families, :person, index: true
  	add_reference :families, :relative, index: true
  end
end
