require 'rails_helper'

describe MediaFilesController do
  context 'when there is a Store with exactly 1 associated MediaFiles' do
    let!(:store) { FactoryGirl.create(:store_with_media_files, media_files_count: 1) }

    describe 'GET :index' do
      it 'responds with a list containing the 1 file' do
        get :index, store_name: store.name
        parsed_json = JSON.parse(response.body)
        expect(parsed_json.count).to eq 1
      end
    end

    describe 'GET :show' do
      it 'responds with JSON for the MediaFile object' do
        get :show, store_name: store.name, id: store.media_files.first.id
        parsed_json = JSON.parse(response.body)
        expect(parsed_json['id']).to eq store.media_files.first.id
      end
    end
  end
end
