Rails.application.routes.draw do
  root to: "root#root"
  resources :posts, except: [:edit, :new]
end
