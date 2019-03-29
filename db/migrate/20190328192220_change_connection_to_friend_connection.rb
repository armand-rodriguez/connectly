class ChangeConnectionToFriendConnection < ActiveRecord::Migration[5.2]
  def change
    rename_table :connections, :friend_connections
  end
end
