json.array!(@others) do |other|
  json.extract! other, :id, :reason
  json.url other_url(other, format: :json)
end
