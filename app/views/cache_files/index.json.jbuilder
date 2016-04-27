json.array!(@cache_files) do |cache_file|
  json.extract! cache_file, :id, :name, :cache_id, :url, :status
  json.url cache_file_url(cache_file, format: :json)
end
