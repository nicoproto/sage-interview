Rails.application.routes.draw do
  resources :queries, only: :create
end
