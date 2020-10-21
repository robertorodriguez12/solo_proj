class Api::V1::Merchants::SearchController < ApplicationController
    def index
        if params[:name]
            merchants = Merchant.find_by_name(params[:name])
            render json: MerchantSerializer.new(merchants)
        end  
    end

    def show
      if params[:name]
        merchant = Merchant.find_by_name(params[:name]).first
        render json: MerchantSerializer.new(merchant)
      end 
    end

    def most_revenue
      # binding.pry
      merchants = Merchant.most_revenue(params[:quantity])
      render json: MerchantSerializer.new(merchants)
    end 
end 