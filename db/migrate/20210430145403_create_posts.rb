class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :country
      t.string :howlong
      t.string :visa
      t.string :schoolname

      t.timestamps
    end
  end
end
