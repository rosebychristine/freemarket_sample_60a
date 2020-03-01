class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :last_name,    null: false
      t.string :first_name,   null: false
      t.string :last_name_kana,    null: false
      t.string :first_name_kana,   null: false
      t.integer :postal_code, null: false
      t.string :prefectures,  null: false
      t.string :buildingname,         null: false           
      t.string :tell,         unique: true
      t.references :user,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
