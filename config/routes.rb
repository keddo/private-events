Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  post 'login', to: 'sessions#create'
  get 'login', to: 'sessions#new' 
  delete 'login', to: 'sessions#destroy'
end
