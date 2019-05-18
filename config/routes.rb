Rails.application.routes.draw do
  resource :pages
  resources :articles
  
  get 'about', to: 'pages#about'
  
  root to:'pages#index'
end
