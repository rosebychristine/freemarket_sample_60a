class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :body
      t.integer :value, null: false
      t.references	:trading, null: false, index: true, foreign_key: true
      t.timestamps
    end
  end
end
