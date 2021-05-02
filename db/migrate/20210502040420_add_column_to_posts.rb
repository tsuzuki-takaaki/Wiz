class AddColumnToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :city, :string
    add_column :posts, :money, :string
    add_column :posts, :agent, :string
    add_column :posts, :necessity, :string
    add_column :posts, :image_name1, :string
    add_column :posts, :image_name2, :string
    add_column :posts, :user_id, :integer
  end
end
