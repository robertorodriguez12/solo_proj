Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do

      namespace :merchants do
        get '/:id/items', to: 'items#index'
        get '/find_all', to: 'search#index'
        get '/find', to: 'search#show'      
      end

      namespace :items do
        get '/find_all', to: 'search#index'
        get '/:id/merchant', to: 'merchants#show'
        get '/find', to: 'search#show'
      end


      resources :merchants
      resources :items
    end 
  end
end
