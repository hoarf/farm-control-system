class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.references :farm, index: true, foreign_key: true


      t.decimal :balance

      t.string :type
      t.string :name

      t.timestamps null: false
    end
  end
end
