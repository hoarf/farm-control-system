class InventoryChange < ActiveRecord::Base
  belongs_to :inventoryable, polymorphic: true
end
