class CreateInventoryChanges < ActiveRecord::Migration
  def change
    create_table :inventory_changes do |t|
      t.integer :males
      t.integer :females
      t.belongs_to :farm
      t.references :inventoryable, polymorphic: true, index: {name: 'index_inventoryable_changes' }
      t.timestamps null: false
    end
  end
end
