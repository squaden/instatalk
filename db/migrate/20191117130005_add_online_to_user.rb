class AddOnlineToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :is_online, :boolean
  end
end
