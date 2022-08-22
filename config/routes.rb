Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: "admin/sessions"
  }
  devise_for :customers, controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  # ,skip: [:passwords], controllers: {
  # registrations: "customer/registrations",
  # sessions: 'customer/sessions'
  # }

  root to: 'public/homes#top'
  # resources :public/items
  #root to: 'admin/homes#top'

  namespace :public do
  #scope module: :customer do
  get "homes/about"=>"homes#about"
  get "/unsubscribe"=>"customers#unsubscribe"
  patch "/withdrawal"=>"customers#withdrawal"
  resources :customers, only: [ :show, :edit, :update]
  resources :items, only: [:index, :show]
  resources :deliveries, only: [:index, :create, :edit, :destroy, :update]
  resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
  post "orders/confirm" => "orders#comfilm"
  get "orders/complete" => "orders#complete"
  resources :orders, only:[:new, :create, :index, :show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do
  get "homes/top" => "homes#top"
  resources :items, only: [:index, :new, :create, :show, :edit, :update]
  # resource :items, only: [:new, :create]
  resources :genres, only: [:index, :create, :edit, :update]
  end
end
