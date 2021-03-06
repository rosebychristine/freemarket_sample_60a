class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :status, null: false
      t.references	:product, null: false, index: true, foreign_key: true
      t.references	:trading, null: false, index: true, foreign_key: true
      t.timestamps
    end
  end
end
