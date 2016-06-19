class CreateInvetoryChanges < ActiveRecord::Migration
  def change
    create_table :invetory_changes do |t|
      t.date :date
      t.integer :amount_male
      t.integer :amount_female

      t.references :changeable, polymorphic: true, index: true
      t.timestamps null: false
    end
  end
end
