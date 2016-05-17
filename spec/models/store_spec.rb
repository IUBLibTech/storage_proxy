require 'rails_helper'

describe Store do
  describe 'factory for :store' do
    it 'returns a Store object' do
      expect(FactoryGirl.build(:store)).to be_a Store
    end
  end

  describe 'factory for :store_with_media_files' do
    let(:store_with_media_files) { FactoryGirl.create(:store_with_media_files) }
    it 'returns a Store object with associated MediaFile objects' do
      # Expect the thing returned to be a Store
      expect(store_with_media_files).to be_a Store

      # Expect the thing returned to have #media_files
      expect(store_with_media_files.media_files).to_not be_empty

      # Expect each of the things in #media_files to be a MediaFile
      store_with_media_files.media_files.each do |media_file|
        expect(media_file).to be_a MediaFile
      end
    end
  end
end
