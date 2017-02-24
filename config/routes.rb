Rails.application.routes.draw do
  get 'users/edit'

  root 'chats#index'
end
