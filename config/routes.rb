Rails.application.routes.draw do
  get 'owner', to: 'owners#index'
  get 'room', to: 'rooms#index'
end
