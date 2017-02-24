Rails.application.routes.draw do
  resources :users, only: :edit
  root 'chats#index'
end
