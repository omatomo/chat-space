Rails.application.routes.draw do
  get 'groups/new'

  get 'groups/create'

  get 'groups/edit'

  get 'groups/update'

  devise_for :users
  root 'chats#index'
end
