require 'rails_helper'

describe 'Routes starting with /caches/' do
  let(:fake_cache_id) { "abc123" }
  let(:fake_file_id) { "def456" }

  describe 'GET /caches' do
    it 'is routable' do
      expect(get: '/caches').to be_routable
    end
  end

  describe 'GET /caches/:id' do
    it 'is routable' do
      expect(get: "/caches/#{fake_cache_id}").to be_routable
    end
  end

  describe 'GET /caches/:id/files' do
    it 'is routable' do
      expect(get: "/caches/#{fake_cache_id}/files").to be_routable
    end
  end

  describe 'GET /caches/:id/files/:id' do
    it 'is routable' do
      expect(get: "/caches/#{fake_cache_id}/files/#{fake_file_id}").to be_routable
    end
  end
end
