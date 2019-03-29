class AddStatusToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :registration_status_id, :integer, default: 1, null: false
  end
end
