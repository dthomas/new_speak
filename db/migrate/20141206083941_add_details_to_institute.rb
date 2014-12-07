class AddDetailsToInstitute < ActiveRecord::Migration
  def change
    add_column :institutes, :last_admission_number, :integer, default: 1
    add_column :institutes, :last_employee_number, :integer, default: 1
  end
end
