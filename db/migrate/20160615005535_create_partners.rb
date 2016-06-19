class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :name
      t.string :contact
      t.references :deals, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
