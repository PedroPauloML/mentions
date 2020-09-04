Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/users/for_mentions', to: 'users#for_mentions', as: 'users_for_mentions'
  resources :users
  resources :posts
  get '/mentions', to: 'mentions#index', as: 'mentions'

  root "users#index"
end
