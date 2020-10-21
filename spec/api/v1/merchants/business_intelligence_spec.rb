require 'rails_helper'

RSpec.describe 'BUSINESS INTELLIGENCE' do
    describe 'merchant revenue' do
        before :each do
            @customer = create(:customer)
            @merchant = Merchant.create(name: 'The Juan')
            @item1 = @merchant.items.create( name: 'saw', description: 'sharp', unit_price: 12.01)
            @item2 = @merchant.items.create( name: 'saw 2', description: 'extra sharp', unit_price: 15.01)
            @invoice = @merchant.invoices.create(customer_id: @customer.id, status: 'shipped')
            @it_inv = @item1.invoice_items.create(invoice_id: @invoice.id, quantity: 2, unit_price: @item2.unit_price)
            @transaction = @invoice.transactions.create(credit_card_number: 111, credit_card_expiration_date: 12072022, result: 'success')
            @merchant2 = Merchant.create!(name: 'Not Juan')
            @item4 = @merchant2.items.create( name: 'blade', description: 'sharp', unit_price: 15.00)
            @item5 = @merchant2.items.create( name: 'blade 2', description: 'extra sharp', unit_price: 18.01)
            @invoice2 = @merchant2.invoices.create(customer_id: @customer.id, status: 'shipped')
            @it_inv2 = @item5.invoice_items.create!(invoice_id: @invoice.id, quantity: 4, unit_price: @item5.unit_price)
            @transaction2 = @invoice2.transactions.create(credit_card_number: 111, credit_card_expiration_date: 12072022, result: 'success')
        end
        
        it 'can get merchants with most revenue' do
            get '/api/v1/merchants/most_revenue?quantity=2'

            expect(response).to be_successful

            json = JSON.parse(response.body, symbolize_names: true)
            merchants = json[:data]

            expect(merchants.first).to eq(merchant2)
        end
    
        xit 'can get merchants who have sold the most items' do
            
        end
    
        xit 'can get revenue between two dates' do
            
        end
    end
end 