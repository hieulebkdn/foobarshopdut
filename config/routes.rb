Rails.application.routes.draw do

  get 'orders_history/index'

  get 'orders_history/new'

  get 'orders_history/show'

  get 'orders_history/create'

  get 'orders_history/edit'

  get 'orders_history/destroy'

  get'admin/index'

  get 'admin_users/index'

  get 'admin_users/new'

  get 'admin_users/show'

  get 'admin_users/create'

  get 'admin_users/edit'

  get 'admin_users/destroy'

  get 'admin_products/index'

  get 'admin_products/new'

  get 'admin_products/show'

  get 'admin_products/create'

  get 'admin_products/edit'

  get 'admin_products/destroy'

  get 'product/index'

  get 'product/new'

  get 'product/create'

  get 'product/show'

  get 'product/destroy'

  get 'shops/index'

  get 'shops/new'

  get 'shops/create'

  get 'shops/show'

  get 'shops/destroy'

  get 'checkout/index'

  get 'checkout/new'

  get 'checkout/create'

  get 'checkout/show'

  get 'checkout/destroy'

  get 'home/index'

  get 'home/new'

  get 'home/show'

  get 'home/destroy'

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
  resources :change_password
  resources :shops 
  get 'home/index'

  get '/signup', to: 'users#new'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/change_password', to: 'change_password#index'

  get '/shops', to: 'shops#index'
  get '/carts', to: 'carts#index' #gio hang
  get '/checkouts', to: 'checkout#index' #dat mua sp
  get '/orders_history', to: 'orders_history#index' #nhung sp da mua

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
