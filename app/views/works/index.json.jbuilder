json.array!(@works) do |work|
  json.extract! work, :id, :identifier, :title
  json.url work_url(work, format: :json)
end
