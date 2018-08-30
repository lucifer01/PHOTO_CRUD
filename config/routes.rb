Rails.application.routes.draw do
  post 'likes/up', to: "likes#up"
  post 'likes/down', to: "likes#down"
  get 'likes/show/like/:id', to: "likes#show_likes", as: 'likes_show_like'
  get 'likes/show/dislike/:id', to: "likes#show_dislikes", as: 'likes_show_dislike'

  resources :comments
  get 'pics/:id', to: "pics#show"
  delete 'pics/:id', to: "pics#del",  as: 'pics_del'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'posts#index'

  get 'posts/profile', to: "posts#profile"
  resources :posts
    devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/test', to: 'application#test'


end
