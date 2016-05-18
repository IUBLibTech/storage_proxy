require 'rails_helper'

describe CacheFilesController do
  context 'when there is a Cache with exactly 1 associated CacheFile' do
    let!(:cache) { FactoryGirl.create(:cache_with_cache_files, cache_files_count: 1) }

    describe 'GET :index' do
      it 'responds with a list containing the 1 file' do
        get :index, cache_id: cache.id
        parsed_json = JSON.parse(response.body)
        expect(parsed_json.count).to eq 1
      end
    end

    describe 'GET :show' do
      it 'responds with JSON for the CacheFile object' do
        cache_file = cache.cache_files.first

        expected_parsed_json = {
          'name' => cache_file.name,
          'status' => cache_file.status,
          'url' => cache_file.url
        }

        get :show, cache_id: cache.id, id: cache_file.id

        actual_parsed_json = JSON.parse(response.body)
        expect(actual_parsed_json).to eq expected_parsed_json
      end
    end
  end
end
