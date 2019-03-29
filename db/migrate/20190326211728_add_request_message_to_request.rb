class AddRequestMessageToRequest < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :request_message, :text
  end
end
