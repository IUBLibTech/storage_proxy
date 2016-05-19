FactoryGirl.define do
  factory :job do
    cache
    cache_file_name nil
    job_type Job::TYPES.values.sample
    status Job::STATUSES[:complete]
  end
end
