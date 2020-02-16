class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :postal_code, null: false
      t.string :country,      null: false
      t.string :prefectures,  null: false
      t.string :city,         null: false
      t.string :address,      null: false
      t.string :name,         null: false
      t.string :last_name,    null: false
      t.string :tell,         unique: true
      t.references :user,     null: false, foreign_key: true

      t.timestamps
    end
  end
end
