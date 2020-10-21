require 'rails_helper'

RSpec.describe 'ITEMS SEARCH ENDPOINT' do
    it 'can find a list of items that contain a fragment, case insensitive' do
        id_1 = create(:merchant).id
        
        item1 = Item.create( name: 'saw', description: 'sharp', merchant_id: id_1, unit_price: 12.01)
        item2 = Item.create( name: 'saw 2', description: 'extra sharp', merchant_id: id_1, unit_price: 15.01)
        item3 = Item.create( name: 'knife', description: 'a little sharp', merchant_id: id_1, unit_price: 9.01)

        get '/api/v1/items/find_all?name=saw'

        expect(response).to be_successful

        json = JSON.parse(response.body, symbolize_names: true)
        items = json[:data]
        expect(items.count).to eq(2)
    end

    it 'can find an item that contains a fragment, case insensitive' do
        id_1 = create(:merchant).id
        
        item1 = Item.create( name: 'saw', description: 'sharp', merchant_id: id_1, unit_price: 12.01)
        item2 = Item.create( name: 'saw 2', description: 'extra sharp', merchant_id: id_1, unit_price: 15.01)
        item3 = Item.create( name: 'knife', description: 'a little sharp', merchant_id: id_1, unit_price: 9.01)

        get '/api/v1/items/find?name=saw'

        json = JSON.parse(response.body, symbolize_names: true)
        name = json[:data][:attributes][:name].downcase

        expect(json[:data]).to be_a(Hash)
        expect(name).to include('saw')
    end 

end 