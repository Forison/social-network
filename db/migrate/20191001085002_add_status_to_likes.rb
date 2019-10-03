class AddStatusToLikes < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :status, :boolean, default: false
  end
end
