class CreateOthers < ActiveRecord::Migration
  def change
    create_table :others do |t|
      t.string :reason

      t.timestamps null: false
    end
  end
end
