require 'rails_helper'

RSpec.describe 'ITEMS SEARCH ENDPOINT' do
    it 'can find a list of items that contain a fragment, case insensitive' do
        id_1 = create(:merchant).id
        
        item1 = { name: 'saw', description: 'sharp', merchant_id: id_1, unit_price: 12.01}
        item1 = { name: 'saw 2', description: 'extra sharp', merchant_id: id_1, unit_price: 15.01}
        item1 = { name: 'knife', description: 'a little sharp', merchant_id: id_1, unit_price: 9.01}

        get '/api/v1/items/find_all?name=saw'

        expect(response).to be_successful


    end

end 