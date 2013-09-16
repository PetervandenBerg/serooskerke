json.array!(@impressions) do |impression|
  json.extract! impression, 
  json.url impression_url(impression, format: :json)
end
