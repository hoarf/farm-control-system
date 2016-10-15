class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.date :date
      t.references :inventory, index: true, foreign_key: true
      t.decimal :amount
      t.decimal :cost
      t.string :type

      t.timestamps null: false
    end
  end
end
