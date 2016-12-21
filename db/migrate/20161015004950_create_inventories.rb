class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.string :item
      t.string :system_name
      t.text :description
      t.string :type
      t.string :unit
      t.references :farm, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
