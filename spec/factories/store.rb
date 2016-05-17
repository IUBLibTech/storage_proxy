FactoryGirl.define do
  factory :store do
    sequence(:name) { |n| "test_store_#{n}" }

    factory :store_with_media_files, class: "Store" do
      transient do
        media_files_count 2
      end

      after(:create) do |store, evaluator|
        create_list(:media_file, evaluator.media_files_count, store: store)
      end
    end
  end
end
