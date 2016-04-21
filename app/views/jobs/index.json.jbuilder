json.array!(@jobs) do |job|
  json.extract! job, :id, :identifier
  json.url job_url(job, format: :json)
end
