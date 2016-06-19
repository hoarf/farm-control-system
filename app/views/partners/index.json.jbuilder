json.array!(@partners) do |partner|
  json.extract! partner, :id, :name, :contact, :deals_id
  json.url partner_url(partner, format: :json)
end
