class CreateDatatableFacts < ActiveRecord::Migration
  def change
    create_view :datatable_facts
  end
end
