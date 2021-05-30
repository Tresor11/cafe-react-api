require 'rails_helper'

RSpec.describe 'Authentication', type: :request do
  # Authentication test suite
  describe '/items endpoint' do
    # create test user
    let!(:image) { Rack::Test::UploadedFile.new("#{Rails.root}/spec/support/js.png", 'profile') }
    def item_headers
      {
        'Content-Type' => 'application/json'
      }
    end

    let(:name) { 'simple name' }

    let(:invalid_attributes) do
      attributes_for(:item, name: 'invalid', category: '')
    end

    def valid_attributes
      attributes_for(:item,
                     name: 'invalid',
                     category: 'test',
                     price: 10,
                     image: image)
    end

    context 'Item requests' do
      it 'returns an empty array if there is no created items' do
        get '/items', headers: item_headers
        expect(json).to eq([])
      end

      it 'Does not create an item with invalid informations' do
        expect do
          post '/items',
               params: invalid_attributes
        end.to raise_error(ActiveRecord::RecordInvalid,
                           "Validation failed: Category can't be blank, Image can't be blank")
      end

      it 'create an item if attribute are valid' do
        post '/items', headers: item_headers, params: valid_attributes
        expect(json['id']).not_to be(nil)
      end
    end
  end
end
