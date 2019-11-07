Rails.application.routes.draw do
  get 'login', to: 'sessions#new', as: :login
  root 'chat_rooms#index'
end
