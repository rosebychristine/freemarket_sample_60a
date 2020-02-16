class CreateOders < ActiveRecord::Migration[5.2]
  def change
    create_table :oders do |t|
      t.references :product,    null: false, foreign_key: true
      t.references :user,       null: false,foreign_key: true

      t.timestamps
    end
  end
end
