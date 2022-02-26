Rails.application.routes.draw do
  root to: 'pages#home'
  resources :queries, only: :create do
    post '/send', to: 'queries#send_facts'
  end
end
