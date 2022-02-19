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
  patch 'update_owner_status', to: 'owners#update_status'

  get 'room', to: 'rooms#index'
  get 'room/join/:token', to: 'rooms#show'
  get 'room/:token', to: 'rooms#find_one'
  get 'status_of_room/:token', to: 'rooms#status'
  post 'room', to:'rooms#create'

  get 'visitor', to: 'visitors#index'
  get 'visitor/:id', to: 'visitors#show'
  get 'visitor/room/:room_id', to: 'visitors#find_visitors_by_room'
  post 'visitor', to: 'visitors#create'
  patch 'update_visitor_status', to: 'visitors#update_status'


  get 'right_swipe', to:'right_swipes#index'
  get 'get_all_right_swipes/:room_id', to:'right_swipes#get_rooms_liked_anime'
  post 'right_swipe', to: 'right_swipes#create'

  mount ActionCable.server => '/cable'
  
end