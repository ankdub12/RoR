Rails.application.routes.draw do
root 'sessions#new'
get '/sessions/new' => 'sessions#new'
post '/sessions/create' => 'sessions#login'

get '/user/new' => 'user#new'
post '/user/create' => 'user#create'

post '/likes' => 'likes#create'

get '/secrets' => 'secrets#index'
post '/secrets/:id/create' => 'secrets#create' 
delete '/secrets/:id' => 'secrets#destroy'

patch '/user/:id/update' => 'user#update'
delete '/user/:id/delete' => 'user#delete'
get '/user/:id/edit' => 'user#edit'
get '/user/:id' => 'user#show'
delete '/sessions' => 'user#logout'

 # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
