json.array!(@comments) do |comment|
  json.extract! comment, :name, :message
  json.url comment_url(comment, format: :json)
end
