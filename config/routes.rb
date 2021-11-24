Rails.application.routes.draw do
  resources :rooms
  resources :show_times
  resources :movies
  root to: 'hello#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
