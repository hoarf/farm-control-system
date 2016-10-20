class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.references :inventory, index: true, foreign_key: true
      t.references :move, index: true, foreign_key: true
      t.decimal :amount
      t.string :type

      t.timestamps null: false
    end
  end
end
