class AddTypeToFacts < ActiveRecord::Migration
  def change
    add_column :facts, :type, :string
  end
end
