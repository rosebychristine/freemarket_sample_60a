class AddphoneNumberTousers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :phone_number, :text, null: false
  end
end
