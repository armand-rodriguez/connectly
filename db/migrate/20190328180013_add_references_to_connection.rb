class AddReferencesToConnection < ActiveRecord::Migration[5.2]
  def change
    add_column :connections, :user_id, :integer, index: true
    add_column :connections, :second_user_id, :integer, index: true
  end
end
