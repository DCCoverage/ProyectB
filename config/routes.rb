Rails
  .application
  .routes
  .draw do
    resources :rooms
    resources :movies do
      resources :show_times, only: %i[new create index show]
    end
    resources :show_times, only: [:index, :edit, :update, :destroy, :show] do
      resources :movie_tickets, only: %i[new create edit update destroy]
    end

    root to: 'show_times#index'
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
