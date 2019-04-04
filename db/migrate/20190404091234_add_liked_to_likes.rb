class AddLikedToLikes < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :liked, :boolean, default: true, null: false
  end
end
