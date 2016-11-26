class CreateDatatableInventories < ActiveRecord::Migration
  def change
    create_view :datatable_inventories
  end
end
