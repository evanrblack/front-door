Rails.application.routes.draw do
  devise_for :users, path: '',
                     path_names: { sign_in: 'log-in', sign_out: 'log-out' }

  root 'pages#home'

  # get 'sign-up', 'clients#new'
  # post 'sign-up'
end
