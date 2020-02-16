class CreateProductsCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :products_categories do |t|
      t.references :category,     null: false, foreign_key: true
      t.references :products,     null: false, foreign_key: true

      t.timestamps
    end
  end
end
