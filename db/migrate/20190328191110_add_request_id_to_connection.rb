class AddRequestIdToConnection < ActiveRecord::Migration[5.2]
  def change
    add_column :connections, :request_id, :integer, index: true
  end
end
