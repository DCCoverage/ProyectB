Rails
  .application
  .routes
  .draw do
    resources :movies do
      resources :show_times, only: %i[new create index]
    end
    resources :show_times, only: %i[index edit update destroy show] do
      get :select_tickets, on: :member
      post :purchase_tickets, on: :member
    end
    resources :movie_tickets, except: %i[new create]

    root to: 'show_times#index'
  end
