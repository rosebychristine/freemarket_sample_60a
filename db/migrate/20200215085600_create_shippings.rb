class CreateShippings < ActiveRecord::Migration[5.2]
  def change
    create_table :shippings do |t|
      t.string :fee_burden,      null: false
      t.string :shipping_time,   null: false
      t.string :prefectures,     null: false
      t.timestamps
    end
  end
end
