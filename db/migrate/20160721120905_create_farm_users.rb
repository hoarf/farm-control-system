class CreateFarmUsers < ActiveRecord::Migration
  def change
    create_table :farms_users, id: false do |t|
      t.belongs_to :farm, index: true
      t.belongs_to :user, index: true
      t.timestamps null: false
    end
  end
end
