class UpdateInventoryAccountSystemName < ActiveRecord::Migration
  def up
    (Account.find_by name: "Estoques").update(system_name: "inventory")
  end

  def down
    (Account.find_by name: "Estoques").update(system_name: "")
  end
end
