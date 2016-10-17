class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :name
      t.text :contact

      t.timestamps null: false
    end
  end
end
