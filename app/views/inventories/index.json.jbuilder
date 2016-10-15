json.array!(@inventories) do |inventory|
  json.extract! inventory, :id, :item, :initial_amount, :initial_cost, :description
  json.url inventory_url(inventory, format: :json)
end
