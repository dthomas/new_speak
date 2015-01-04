class AddClassTeacherToClassGroups < ActiveRecord::Migration
  def change
    add_reference :class_groups, :class_teacher, index: true
  end
end
