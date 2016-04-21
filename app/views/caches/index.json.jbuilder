json.array!(@caches) do |cache|
  json.extract! cache, :id, :name
  json.url cache_url(cache, format: :json)
end
