Rails.application.routes.draw do
  resources :visitors
  get 'owner', to: 'owners#index'
  get 'room', to: 'rooms#index'
  get 'visitor', to: 'visitors#index'
end
