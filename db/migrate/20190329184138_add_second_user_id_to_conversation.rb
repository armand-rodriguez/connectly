class AddSecondUserIdToConversation < ActiveRecord::Migration[5.2]
  def change
    add_column :conversations, :second_user_id, :integer, index: true
  end
end
