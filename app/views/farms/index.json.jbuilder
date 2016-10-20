json.array!(@farms) do |farm|
  json.extract! farm, :id, :show
  json.url farm_url(farm, format: :json)
end
