Rails
  .application
  .routes
  .draw do
    resources :movies do
      resources :show_times, only: %i[new create index]
    end
    resources :show_times, only: %i[index edit update destroy show] do
      resources :movie_tickets, only: %i[new create]
    end
    resources :movie_tickets, except: %i[new create]

    root to: 'show_times#index'
  end
