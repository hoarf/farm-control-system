class CreateFacts < ActiveRecord::Migration
  def change
    create_table :facts do |t|
      t.date :date
      t.text :description

      t.timestamps null: false
    end
  end
end
