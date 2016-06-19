class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.date :date
      t.decimal :price
      t.integer :males
      t.integer :females
      t.float :live_weight
      t.float :dead_weight
      t.string :deal_type
      t.string :reason
      t.references :partner, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
