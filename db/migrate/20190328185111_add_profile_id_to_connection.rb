class AddProfileIdToConnection < ActiveRecord::Migration[5.2]
  def change
    add_column :connections, :profile_id, :integer, index: true
  end
end
