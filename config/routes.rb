Rails.application.routes.draw do
  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  devise_for :customers, skip: [:passwords], controllers: {
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

  #root to: 'public/homes#top'

  namespace :public do
  #scope module: :customer do
  get "homes/about"=>"homes#about"
  get "/unsubscribe"=>"customers#unsubscribe"
  patch "/withdrawal"=>"customers#withdrawal"
  resources :customers, only: [ :show, :edit, :update]
  resources :items, only: [:index, :show]

  resources :deliveries, only: [:index, :create, :edit, :destroy, :update]
  resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
  post "orders/comfirm" => "orders#comfirm"
  get "orders/complete" => "orders#complete"
  resources :orders, only:[:new, :create, :index, :show]

  resources :deliveries, only: [:index, :create, :edit]
  delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
  resources :cart_items, only: [:index, :update, :destroy, :create]

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do
  get "homes/top" => "homes#top"
  resources :customers, only: [:index, :show, :edit, :update]
  resources :items, only: [:index, :new, :create, :show, :edit, :update]
  resources :genres, only: [:index, :create, :edit, :update]
  end
end
