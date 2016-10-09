json.array!(@facts) do |fact|
  json.extract! fact, :id
  json.url fact_url(fact, format: :json)
end
