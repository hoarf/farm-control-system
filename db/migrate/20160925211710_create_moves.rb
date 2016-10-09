class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.references :debit
      t.references :credit
      t.references :fact, index: true, foreign_key: true
      t.references :partner, index: true, foreign_key: true

      t.string :type
      t.decimal :amount
      t.text :evidence

      t.timestamps null: false

    end
  end
end
