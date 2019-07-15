Rails.application.routes.draw do
  # devise_for :users
  namespace :v1, defaults: {format: 'json'} do
    resources :posts, param: :slug do
      resources :comments
      resources :likes
    end
    resources :sessions, only: [:create]
    resources :users, only: [:create]
    # post 'auth/sessions', to: 'sesssion#authenticate'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
