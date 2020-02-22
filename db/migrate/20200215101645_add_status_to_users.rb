class AddStatusToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name_middle, :string, null: false
    add_column :users, :name_last, :string, null: false
    add_column :users, :name_middle_kana, :string, null: false
    add_column :users, :name_last_kana, :string, null: false
    add_column :users, :nickname, :string, null: false
    add_column :users, :credit_card_no, :integer, null: false
    add_column :users, :creditmonth_id, :integer, null: false
    add_column :users, :credityear_id, :integer, null: false
    add_column :users, :credit_card_security_code, :integer, null: false
  end
end
