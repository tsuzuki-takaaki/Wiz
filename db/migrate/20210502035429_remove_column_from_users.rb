class RemoveColumnFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :city
    remove_column :users, :money
    remove_column :users, :agent
    remove_column :users, :necessity
  end
end
