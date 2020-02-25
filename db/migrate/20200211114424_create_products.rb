class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name,             null: false, default: ""
      t.integer :price,           null: false, default: 0
      t.string :condition,        null: false, default: ""
      t.text :description,        null: false
      t.string :fee_burden,       null: false, default: ""
      t.string :shipping_time,    null: false, default: ""
      t.string :prefectures,      null: false, default: ""
      t.references :user,         foreign_key: true 
      t.timestamps
    end
  end
end
