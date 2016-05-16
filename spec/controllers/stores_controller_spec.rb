require 'rails_helper'

describe StoresController, type: :controller do
  describe 'GET :index' do
    context 'when there are 0 stores' do
      it 'responds with an empty array' do
        get :index
        expect(JSON.parse(response.body)).to eq []
      end
    end

    context 'when there is exactly 1 store' do
      let!(:store) { FactoryGirl.create(:store) }

      it 'responds with an array containing the single store' do
        get :index
        parsed_json = JSON.parse(response.body)

        # Expect there to be just 1 store in the JSON response.
        expect(parsed_json.count).to eq 1

        # Expect the store name in the JSON response to match the name of the
        # Store object.
        expect(parsed_json.first['name']).to eq store.name
      end
    end

    context 'when there are multiple stores' do
      let!(:stores) { FactoryGirl.create_list(:store, 5) }

      it 'responds with an array containing the all the stores' do
        get :index
        parsed_json = JSON.parse(response.body)

        # Expect 5 stores in the JSON response.
        expect(parsed_json.count).to eq 5

        # Expect the store names from the JSON response to be equal to the
        # names of the Store objects.
        names_from_json = parsed_json.map { |store_json| store_json["name"] }
        names_from_objects = stores.map(&:name)
        expect(names_from_json).to eq names_from_objects
      end
    end
  end

  describe 'GET :show,' do
    context "when given a valid Store name" do
      let!(:store) { FactoryGirl.create(:store) }

      it 'responds with JSON for the Store object' do
        get :show, name: store.name

        parsed_json = JSON.parse(response.body)
        expect(parsed_json["name"]).to eq store.name
      end
    end

    context "when given an invalid Store id" do
      it 'TODO - return an error of some kind?'
    end

  end

  describe 'GET :search' do
    it 'TODO - not sure exactly how search should work'
  end
end
