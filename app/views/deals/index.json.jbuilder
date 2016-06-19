json.array!(@deals) do |deal|
  json.extract! deal, :id, :date, :price, :males, :females, :live_weight, :dead_weight, :deal_type, :reason, :partner_id
  json.url deal_url(deal, format: :json)
end
