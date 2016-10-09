class AddFarmToUsers < ActiveRecord::Migration
  def change
    add_reference :user, :farm, index: true, foreign_key: true
  end
end
