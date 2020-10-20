require 'rails_helper'

RSpec.describe "ITEMS API" do
    it "sends a list of items" do
        create_list(:item, 4)

        get "/api/v1/items"

        expect(response).to be_successful
        json = JSON.parse(response.body, symbolize_names: true)
        items = json[:data]
        expect(items.count).to eq(4)
    end

    it "can get one item by it's id" do 
        id = create(:item).id

        get "/api/v1/items/#{id}"

        expect(response).to be_successful

        json = JSON.parse(response.body, symbolize_names: true)
        item = json[:data]

        expect(item).to have_key(:id)
        expect(item[:id]).to be_a(String)

        expect(item[:id]).to eq(id.to_s)
    end 

    it 'can create a new item' do
        merchant = create(:merchant)

        item_params = { name: 'Saw',
                        description: 'A sharp saw',
                        unit_price: 132.0,
                        merchant_id: merchant.id }
        headers = {"CONTENT_TYPE" => "application/json"}
        post "/api/v1/items", headers: headers, params: JSON.generate(item_params)

        created_item = Item.last

        expect(response).to be_successful

        expect(created_item.name).to eq(item_params[:name])
    end

    it 'can update an existing item' do
        id = create(:item).id
        previous_name = Item.last.name

        item_params = { name: "Whiffle Ball" }
        headers = {"CONTENT_TYPE" => "application/json"}
        patch "/api/v1/items/#{id}", headers: headers, params: JSON.generate(item_params)

        item = Item.find(id)

        expect(response).to be_successful

        expect(item.name).to_not eq(previous_name)
        expect(item.name).to eq(item_params[:name])
    end

    it 'can destroy an item' do
        item = create(:item)

        expect{ delete "/api/v1/items/#{item.id}" }.to change(Item, :count).by(-1)

        expect(response).to be_successful
        expect{Item.find(item.id)}.to raise_error(ActiveRecord::RecordNotFound)
    end
end