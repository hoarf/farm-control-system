json.array!(@entries) do |entry|
  json.extract! entry, :id, :date, :inventory_id, :amount, :cost, :type
  json.url entry_url(entry, format: :json)
end
