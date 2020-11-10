Rails.application.routes.draw do
  resources :right_swipes
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
  get 'right_swipe', to:'right_swipes#index'
  post 'right_swipe', to: 'right_swipes#create'
end
