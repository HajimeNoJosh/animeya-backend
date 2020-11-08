Rails.application.routes.draw do
  resources :visitors
  get 'owner', to: 'owners#index'
  get 'room', to: 'rooms#index'
  post 'room', to:'rooms#create'
  get 'visitor', to: 'visitors#index'
  post 'owner', to: 'owners#create'
  post 'visitor', to: 'visitors#create'
  get 'visitor/:id', to: 'visitors#show'
  get 'room/:token', to: 'rooms#show'
  patch 'owner/:id', to: 'owners#update'
end
