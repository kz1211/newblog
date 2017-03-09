Rails.application.routes.draw do

  resources :tags, only: [:show]
  resources :users, only: [:show]
  resource :users, only: [:update, :edit], path: 'user'
  root 'posts#index'
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  devise_for :users # todo: убери потом измнения юзера из дивайса

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

