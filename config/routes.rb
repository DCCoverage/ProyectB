Rails.application.routes.draw do
  namespace :api do
    get '/hello', to: 'hello#say_hello'
  end

  root 'application#index'
  get '/*path', to: 'application#index'
end
