class AddLoginableToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :loginable, polymorphic: true, index: true
  end
end
