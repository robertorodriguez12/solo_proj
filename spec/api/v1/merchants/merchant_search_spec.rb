require 'rails_helper'

RSpec.describe 'MERCHANTS SEARCH ENDPOINT' do
    it 'can return a list of merchants that contain a fragment, case insensitive' do
        merchant = Merchant.create!{name: 'The Juan'}
        merchant2 = Merchant.create!{name: 'Not Juan'}
        merchant3 = Merchant.create!{name: 'Maybe Juan'}

        get '/api/v1/merchants/find_all?name=saw'

        expect(response).to be_successful
    end
end