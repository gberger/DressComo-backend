Rails.application.routes.draw do
  devise_for :users

  namespace :api do

    get    'profiles/:id',   to: 'profiles#show'
    put    '/profiles/self', to: 'profiles#update'

    get    '/posts',      to: 'posts#index'
    post   '/posts',      to: 'posts#create'
    get    '/posts/:id',  to: 'posts#show'
    put    '/posts/:id',  to: 'posts#update'
    delete '/posts/:id',  to: 'posts#destroy'
    post   '/posts/:id/likes',      to: 'posts#like'
    post   '/posts/:id/dislikes',   to: 'posts#dislike'
    delete '/posts/:id/likes',      to: 'posts#unlike'
    delete '/posts/:id/dislikes',   to: 'posts#undislike'
    
  end

  match '*a', :to => 'errors#routing', via: [:get, :post, :put, :delete, :any]
end
