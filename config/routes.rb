Rails.application.routes.draw do
<<<<<<< HEAD
  resources :widgets

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  root 'welcome#index'

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
=======

  devise_for :admins
  root 'pages#home'

  devise_for  :users,
              :path => "",
              :controllers => { registrations: 'registrations', :omniauth_callbacks => "users/omniauth_callbacks" },
              :path_names => {:sign_in => "login",
              :sign_out => "logout",
              :edit => "profile"}

  resources :users, only: [:show] do
    resources :galleries
    resources :pictures
  end

  resources :products
  resources :product_photos

  patch "/users/:user_id" => "users#update"

  get "/about_us" => "pages#about_us"

  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end


  get 'search', to: 'users#show'

  resources :products do
    resources :transactions, only: [:create]
  end


>>>>>>> 0478bb66c5aeed21944167d5aa1235cba3cbc3ed
end
