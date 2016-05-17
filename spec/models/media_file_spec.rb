require 'rails_helper'

describe Store do
  let!(:media_file) { FactoryGirl.create(:media_file) }
  it 'has a factory' do
    expect(media_file).to be_a MediaFile
    expect(media_file.store).to be_a Store
  end
end
