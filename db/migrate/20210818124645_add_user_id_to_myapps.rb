class AddUserIdToMyapps < ActiveRecord::Migration[6.1]
  def change
    add_column :myapps, :user_id, :integer
    add_index :myapps, :user_id
  end
end
