FactoryGirl.define do
  factory :cache_file do
    sequence(:name) { |n| "test_cache_file_#{n}" }
    cache
  end
end
