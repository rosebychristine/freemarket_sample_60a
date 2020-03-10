class AddStatusToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name_middle, :string, null: false
    add_column :users, :name_last, :string, null: false
    add_column :users, :name_middle_kana, :string, null: false
    add_column :users, :name_last_kana, :string, null: false
    add_column :users, :nickname, :string, null: false
  end
end
