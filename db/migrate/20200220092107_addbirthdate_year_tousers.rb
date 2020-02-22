class AddbirthdateYearTousers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :birthdate_year, :integer, null: false
    add_column :users, :birthdate_month, :integer, null: false
    add_column :users, :birthdate_day, :integer, null: false
  end
end
