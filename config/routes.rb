Rails.application.routes.draw do
  scope '(:locale)', locale: /en|es/ do
    root to: 'pages#home'
    resources :queries, only: :create do
      post '/send', to: 'queries#send_facts'
    end
  end
end
