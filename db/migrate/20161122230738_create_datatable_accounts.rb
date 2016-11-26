class CreateDatatableAccounts < ActiveRecord::Migration
  def change
    create_view :datatable_accounts
  end
end
