Rails.application.routes.draw do

  devise_for :admins
  root 'pages#home'

  devise_for  :users,
              :path => "",
              :path_names => {:sign_in => "login",
              :sign_out => "logout",
              :edit => "profile"}

  resources :users, only: [:show]
  resources :products

end
