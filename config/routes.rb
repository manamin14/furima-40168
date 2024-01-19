Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'items#index', as: 'items_root'
  resources :items, only: [:index, :new,:create]

  root to: 'articles#index'
  resources :articles
  # Defines the root path route ("/")
  # root "articles#index"
end
