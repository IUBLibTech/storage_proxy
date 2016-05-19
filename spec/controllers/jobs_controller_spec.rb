require 'rails_helper'

describe JobsController, type: :controller do
  # Create a Cache with some CacheFiles
  let!(:cache) { FactoryGirl.create(:cache_with_cache_files) }

  describe 'GET #cache_file_jobs' do
    
    context 'when missing required params' do
      it 'TODO: returns an error. What type of error? 400 Bad request?'
    end

    context 'when given an invalid name of Cache or CacheFile' do
      it 'TOOO: returns an error. What type of error? 400 Bad Request? 404 Not Found?'
    end

    context 'when there are Jobs for the given CacheFile' do
      # Create some Jobs for the first CacheFile in the Cache
      let!(:jobs) { FactoryGirl.create_list(:job, 3, cache: cache, cache_file_name: cache.cache_files.first.name) }

      it 'returns a JSON array of the jobs for for the given cache_name / cache_file_name combination' do
        get :cache_file_jobs, cache_name: cache.name, cache_file_name: cache.cache_files.first.name
        actual_parsed_json = JSON.parse(response.body)
        expected_parsed_json = JSON.parse(jobs.to_json)
        expect(actual_parsed_json).to eq expected_parsed_json
      end

    end

    context 'when there are no jobs for the given CacheFile' do
      it 'returns an empty list' do
        get :cache_file_jobs, cache_name: cache.name, cache_file_name: cache.cache_files.first.name
        parsed_json = JSON.parse(response.body)
        expect(parsed_json).to eq []
      end
    end
  end

  describe 'POST #create' do
    context 'when missing required params' do
      it 'TODO: returns an error. What type of error? 400 Bad request?'
    end

    context 'when given an invalid name of Cache or CacheFile' do
      it 'TOOO: returns an error. What type of error? 400 Bad Request? 404 Not Found?'
    end

  end
end
