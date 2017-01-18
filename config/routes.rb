Rails.application.routes.draw do
  devise_for :users
  resources :tags, only: [:show]
  root 'posts#index'
  resources :posts do
    resources :comments, only: [:new, :create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

