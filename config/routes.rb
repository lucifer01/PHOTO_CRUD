Rails.application.routes.draw do
  get 'pics/:id', to: "pics#show"
  delete 'pics/:id', to: "pics#del",  as: 'pics_del'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'posts#index'
  resources :posts
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/test', to: 'application#test'


end
