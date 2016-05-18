FactoryGirl.define do
  factory :cache_file do
    cache
    sequence(:name) { |n| "test_cache_file_#{n}" }
    status nil
    url nil
  end
end
