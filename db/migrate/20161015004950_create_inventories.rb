class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.string :item
      t.string :system_name
      t.text :description
      t.string :type
      t.string :unit
      t.references :farm, index: true, foreign_key: true

      t.decimal :initial_amount, default: 0
      t.date :date
      t.decimal :initial_balance, default: 0

      t.timestamps null: false
    end
  end
end
