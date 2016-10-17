class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.references :farm, index: true, foreign_key: true
      t.references :parent

      t.decimal :start, default: 0
      t.string :type
      t.string :name

      t.timestamps null: false
    end
  end
end
