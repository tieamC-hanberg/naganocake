Rails.application.routes.draw do
  #get 'homes/top'
  root to: 'public/homes#top'
  # resources :public/items
  namespace :public do
  get "homes/about"=>"homes#about"
  # get "items/index"=>"items#index"
  resources :items, only: [:index, :show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do
  resources :items, only: [:index, :new, :create, :show, :edit]
  # resource :items, only: [:new, :create]
  end
end
