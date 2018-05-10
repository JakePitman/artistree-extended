Rails.application.routes.draw do
  resources :charges
  get 'messages/show'
  get 'messages/new'
  resources :messages
  get 'requests/edit'
  get 'requests/new'
  get 'requests/show'
  get 'requests/deny'
  resources :requests do
    member do
        post 'charge'
    end
  end
  
  resources :prof_pictures
  resources :profile_pictures
  get 'current_user/profile'
  get 'current_user/incoming_requests'
  get 'current_user/outgoing_requests'
  get 'styles/index'
  get 'styles/show'
  get 'styles/:id' => 'styles#show', :as => :style
  get 'users/index'
  get 'users/show'
  devise_for :users
  get 'users/:id' => 'users#show', :as => :user
  resources :portfolio_pictures
  resources :profiles
  root 'pages#welcome'
  get 'pages/welcome'
  get 'pages/home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
