require 'rails_helper'

describe 'Routes starting with /stores/' do
  let(:store_name) { "foo" }
  let(:media_file_id) { SecureRandom.hex }

  describe 'GET /stores/:store_name' do
    it 'is routable' do
      expect(get: "/stores/#{store_name}").to be_routable
    end
  end

  describe 'GET /stores/:store_name/files/' do
    it 'is routable' do
      expect(get: "/stores/#{store_name}/files").to be_routable
    end
  end

  describe 'GET /stores/:store_name/files/:id' do
    it 'is routable' do
      expect(get: "/stores/#{store_name}/files/#{media_file_id}").to be_routable
    end
  end
end
