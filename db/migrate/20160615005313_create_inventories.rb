class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.integer :males
      t.integer :females

      t.integer :singleton_guard
      t.timestamps null: false
    end
    add_index(:inventories, :singleton_guard, :unique => true)
  end
end
