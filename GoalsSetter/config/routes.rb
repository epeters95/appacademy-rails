Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show, :edit, :update] do
    resources :goals, only: [:create]
    resources :comments, only: [:create]
  end
  resources :goals, only: [:destroy, :update] do
    resources :comments, only: [:create]
  end
  resource :session, only: [:create, :destroy]
  root to: 'users#new'
end
