Rails.application.routes.draw do
  get 'login', to: 'sessions#new', as: :login
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  post 'message', to: 'messages#create'

  mount ActionCable.server, at: '/cable'

  root 'chat_rooms#index'
end
