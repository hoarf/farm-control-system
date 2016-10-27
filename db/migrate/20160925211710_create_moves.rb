class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.references :account, index: true, foreign_key: true
      t.string :type
      t.references :fact, index: true, foreign_key: true
      t.decimal :amount

      t.timestamps null: false
    end
  end
end
