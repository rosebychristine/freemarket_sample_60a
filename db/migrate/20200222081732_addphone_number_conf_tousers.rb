class AddphoneNumberConfTousers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :phone_number_conf, :integer, null: false
  end
end
