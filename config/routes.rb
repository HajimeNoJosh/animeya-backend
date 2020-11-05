Rails.application.routes.draw do
  resources :visitors
  get 'owner', to: 'owners#index'
  get 'room', to: 'rooms#index'
  post 'room', to:'rooms#create'
  get 'visitor', to: 'visitors#index'
  post 'owner', to: 'owners#create'
end
