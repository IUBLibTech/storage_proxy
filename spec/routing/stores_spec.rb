require 'rails_helper'

describe 'Routes starting with /stores/' do
  let(:fake_store_id) { "abc123" }
  let(:fake_media_file_id) { "def456" }

  describe 'GET /stores/:id' do
    it 'is routable' do
      expect(get: "/stores/#{fake_store_id}").to be_routable
    end
  end

  describe 'GET /stores/:id/search' do
    it 'is routable' do
      expect(get: "/stores/#{fake_store_id}/search").to be_routable
    end
  end

  describe 'GET /stores/:id/files/' do
    it 'is routable' do
      expect(get: "/stores/#{fake_store_id}/files").to be_routable
    end
  end

  describe 'GET /stores/:id/files/:id' do
    it 'is routable' do
      expect(get: "/stores/#{fake_store_id}/files/#{fake_media_file_id}").to be_routable
    end
  end
end
