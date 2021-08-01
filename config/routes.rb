Rails.application.routes.draw do
  resources :right_swipes
  resources :visitors
  resources :rooms
  resources :owners
  get 'owner', to: 'owners#index'
  get 'owner/:id', to: 'owners#show'
  get 'owner/room/:id', to: 'owners#show_room'
  patch 'owner/:id', to: 'owners#update'
  post 'owner', to: 'owners#create'

  get 'room', to: 'rooms#index'
  get 'room/join/:token', to: 'rooms#show'
  get 'room/:token', to: 'rooms#find_one'
  post 'room', to:'rooms#create'

  get 'visitor', to: 'visitors#index'
  get 'visitor/:id', to: 'visitors#show'
  get 'visitor/room/:room_id', to: 'visitors#find_visitors_by_room'
  post 'visitor', to: 'visitors#create'


  get 'right_swipe', to:'right_swipes#index'
  post 'right_swipe', to: 'right_swipes#create'

  mount ActionCable.server => '/cable'
  
end