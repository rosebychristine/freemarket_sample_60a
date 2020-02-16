class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |t|
      t.references :category,   null: false, foreign_key: true
      t.string :name,           null: false

      t.timestamps
    end
  end
end
