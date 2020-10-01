Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'login', to: 'sessions#create'
  get 'login', to: 'sessions#new' 
  delete 'login', to: 'sessions#destroy'

  resources :events
  root 'events#index'
end
