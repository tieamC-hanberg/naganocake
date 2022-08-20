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
  #root to: 'admin/homes#top'
  
  namespace :public do
  #scope module: :customer do
  get "homes/about"=>"homes#about"
  get "/unsubscribe"=>"customers#unsubscribe"
  patch "/withdrawal"=>"customers#withdrawal"
  resources :customers, only: [ :show, :edit, :update]
  resources :items, only: [:index, :show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
