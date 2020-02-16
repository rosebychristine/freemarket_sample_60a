class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|
      t.references :product,    null: false, foreign_key: true
      t.references :user,       null: false,foreign_key: true
      t.text :text,             null: false
      t.string :rate,           null: false

      t.timestamps
    end
  end
end
