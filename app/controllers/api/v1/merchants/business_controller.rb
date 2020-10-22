class Api::V1::Merchants::BusinessController < ApplicationController
    def most_revenue
      merchants = Merchant.most_revenue(params[:quantity])
      render json: MerchantSerializer.new(merchants)
    end 
end 