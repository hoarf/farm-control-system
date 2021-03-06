class CreateFacts < ActiveRecord::Migration
  def change
    create_table :facts do |t|
      t.date :date
      t.text :description
      t.references :partner, index: true, foreign_key: true
      t.text :evidence

      t.timestamps null: false
    end
  end
end
