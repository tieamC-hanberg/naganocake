Rails.application.routes.draw do
  #get 'homes/top'
  root to: 'public/homes#top'
  # resources :public/items
  namespace :public do
  get "homes/about"=>"homes#about"
  # get "items/index"=>"items#index"
  resources :items, only: [:index, :show]
  resources :deliveries, only: [:index, :create, :edit]
  resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do
  get "homes/top" => "homes#top"
  resources :items, only: [:index, :new, :create, :show, :edit, :update]
  # resource :items, only: [:new, :create]
  resources :genres, only: [:index, :create, :edit, :update]
  end
end
