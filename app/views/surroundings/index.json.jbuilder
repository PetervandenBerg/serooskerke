json.array!(@surroundings) do |surrounding|
  json.extract! surrounding, :title, :description
  json.url surrounding_url(surrounding, format: :json)
end
