Rails.application.routes.draw do
  root 'messages#index'
  resource :user, only: [:edit, :update]
end
