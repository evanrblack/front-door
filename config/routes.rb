Rails.application.routes.draw do
  devise_for :logins, path: '',
                      path_names: { sign_in: 'log-in', sign_out: 'log-out' }

  authenticated :login do
    root 'pages#dashboard', as: :authenticated_root
  end
  
  root 'pages#home'

  resources :admins
  resources :agents
  resources :clients
  resources :listings do
    post :claim, to: 'listings#claim'
  end
  
  # get 'sign-up', 'clients#new'
  # post 'sign-up'
end
