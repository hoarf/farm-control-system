class CreateDatatableMoves < ActiveRecord::Migration
  def change
    create_view :datatable_moves
  end
end
