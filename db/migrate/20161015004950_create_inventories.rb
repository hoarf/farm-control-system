class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.string :item
      t.references :first_entry
      t.text :description
      t.decimal :start_amount, default: 0
      t.date :start_date
      t.decimal :start_value, default: 0

      t.timestamps null: false
    end
  end
end
