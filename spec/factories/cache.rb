FactoryGirl.define do
  factory :cache do

    sequence(:name) { |n| "test_cache_#{n}" }

    factory :cache_with_cache_files, class: "Cache" do
      transient do
        cache_files_count 2
      end

      after(:create) do |cache, evaluator|
        create_list(:cache_file, evaluator.cache_files_count, cache: cache)
      end
    end
  end
end
