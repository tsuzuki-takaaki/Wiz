class ChangeColumnDefaultToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column_default :users, :email, from: nil, to: ""
    change_column_null :users, :email, false
  end
end
