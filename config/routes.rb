Rails.application.routes.draw do
  #get 'homes/top'
  root to: 'public/homes#top'
  namespace :public do
  get "homes/about"=>"homes#about"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
