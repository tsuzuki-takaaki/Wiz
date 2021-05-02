class AddSomecontentsToPosts < ActiveRecord::Migration[6.1] #意味ないやつ
  def change
    add_column :users, :city, :string
    add_column :users, :money, :string
    add_column :users, :agent, :string
    add_column :users, :necessity, :string
  end
end
