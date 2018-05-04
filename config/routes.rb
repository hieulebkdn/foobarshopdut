Rails.application.routes.draw do
  get'admin/index'

  get 'shops/index'
  get 'shops/new'
  get 'shops/create'
  get 'shops/show'
  get 'shops/destroy'

  get 'home/index'
  root 'home#index'

  resources :line_items
  post '/line_items/create', to: 'line_items#create'
  resources :users
  resources :reviews
  resources :products
  resources :orders
  post '/orders/create', to: 'orders#create'
  resources :order_details
  resources :categories
  resources :carts
  resources :brands
  resources :admins
  resources :password_changes
  resources :shops 
  get 'home/index'

  get '/signup', to: 'users#new'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/shops', to: 'shops#index'
  get '/carts', to: 'carts#index' #gio hang
  get 'sessions/new'
  

  post 'reviews/new'
  get '/admin', to: 'admin#index' #profile
  get '/admin/edit', to: 'admin#edit' #
  get '/admin_products', to: 'admin_products#index'
  get '/admin_products/edit', to: 'admin_products#edit'
  get '/admin_products/create', to: 'admin_products#create' #add sp
  get '/admin_users', to: 'admin_users#index'

  get 'pages/test_function' 
  get 'pages/shop' 
  get 'pages/single_product'
  post 'shops/search'
  post 'shops/filter'
  post 'shops/classify'

  #get products index by brands, do not delete
  get "/single_brand", to: 'products#single_brand'
  
  resources :products do
    collection {post :import}
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
