class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.date :initial_date
      t.string :item
      t.decimal :initial_amount
      t.decimal :initial_cost
      t.text :description

      t.timestamps null: false
    end
  end
end
