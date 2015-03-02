Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    get 'asdf' => 'a#asdf'
  end
end
