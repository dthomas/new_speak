class CreateInstitutes < ActiveRecord::Migration
  def change
    create_table :institutes do |t|
      t.string :name, null: false
      t.string :abbreviation, null: false
      t.string :subdomain, null: false
      t.string :phone, null: false
      t.string :custom_domain
      t.integer :institute_type, default: 0
      t.references :owner, index: true

      t.timestamps null: false
    end
    add_index :institutes, :subdomain, unique: true
    add_index :institutes, :custom_domain, unique: true
    # add_foreign_key :institutes, :users
  end
end
