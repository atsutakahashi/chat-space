Rails.application.routes.draw do
  devise_for :users
  root 'messages#index'
  resource :user, only: [:edit, :update]
  resources :groups, only: [:index, :new, :create, :edit, :update] do
  end
end
