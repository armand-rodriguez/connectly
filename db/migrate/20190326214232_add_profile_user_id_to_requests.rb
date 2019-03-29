class AddProfileUserIdToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :profile_user_id, :integer, index: true
  end
end
