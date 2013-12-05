Betastore::Application.routes.draw do
  namespace :admin do
    resources :products
    resources :orders
    root :to => 'dashboard#index'
    # root :to => 'products#index'
  end

  # resources :categories do
  #   resources :products, only: [:index]
  # end
  get '/categories/:category_id/products' => 'products#index', as: 'category_products'

  get '/cart' => 'cart_items#index', as: 'cart_items'
  post '/products/:product_id/cart_items' => 'cart_items#create', as: 'add_to_cart'

  resources :subscriptions
  #root :to => 'subscriptions#new'

  get '/sign_up' => 'customers#new', as: 'sign_up'
  post '/sign_up' => 'customers#create'

  resources :products
  root :to => 'products#index'

  get '/log_in'  => 'log_ins#new', as: 'log_in'
  post '/log_in'  => 'log_ins#create'
  post '/log_out' => 'log_ins#destroy', as: 'log_out'

  get '/forgot_password' => 'password_resets#new', as: 'forgot_password'
  post '/forgot_password' => 'password_resets#create'
  get '/reset_password/:id/:token' => 'password_resets#edit', as: 'reset_password'
  post '/reset_password/:id/:token' => 'password_resets#update'

  get '/checkout' => 'orders#new', as: 'checkout'
  # display a form with button to submit order
  post '/checkout' => 'orders#create'
# redirect to home with flash that order was placed

# create an action for new that renders a form 
# create gets posted to

  




  # resources :orders do
  #   resources :refund
  # end

  #root :to => 'subscriptions#new'
  #root :to => 'subscriptions#index'
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
