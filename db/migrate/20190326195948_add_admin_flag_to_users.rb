class AddAdminFlagToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :admin, :boolean, default: true, null: false
  end
end
