class AddDobToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :dob, :datetime
  end
end
