class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.string :item
      t.text :description

      t.decimal :initial_amount, default: 0
      t.datetime :date, default: Time.now
      t.decimal :initial_balance, default: 0

      t.timestamps null: false
    end
  end
end
