class AddRequestStatusRefToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :request_status_id, :integer, index: true, default: 1, null: false
  end
end
