require 'rails_helper'

RSpec.describe 'MERCHANTS SEARCH ENDPOINT' do
    it 'can return a list of merchants that contain a fragment, case insensitive' do
        merchant = Merchant.create!(name: 'The Juan')
        merchant2 = Merchant.create!(name: 'Not Juan')
        merchant3 = Merchant.create!(name: 'Maybe Juan')

        get '/api/v1/merchants/find_all?name=juan'

        expect(response).to be_successful
        json = JSON.parse(response.body, symbolize_names: true)
        merchants = json[:data]

        expect(merchants.count).to eq(3)
    end

    it 'can return a single merchant that contains a fragment, case insensitive' do
        merchant = Merchant.create!(name: 'The Juan')
        merchant2 = Merchant.create!(name: 'Not Juan')
        merchant3 = Merchant.create!(name: 'Maybe Juan')

        get '/api/v1/merchants/find?name=juan'

        json = JSON.parse(response.body, symbolize_names: true)
        name = json[:data][:attributes][:name].downcase

        expect(json[:data]).to be_a(Hash)
        expect(name).to include('juan')
    end 
end