class CreateBalanceChanges < ActiveRecord::Migration
  def change
    create_table :balance_changes do |t|
      t.decimal :amount
      t.references :balanceable, polymorphic: true, index: { name: 'index_balanceable_changes' }
      t.belongs_to :farm
      t.timestamps null: false
    end
  end
end
