class CreateAdresses < ActiveRecord::Migration[5.2]
  def change
    create_table :adresses do |t|
      t.integer :postal_code, null: false
      t.string :country, null: false
      t.string :prefectures, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :name, null: false
      t.string :last_name, null: false
      t.string :tell, unique: true
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
