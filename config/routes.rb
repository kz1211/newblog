Rails.application.routes.draw do


  resources :categories
  resources :tags, only: [:show]
  resources :users, only: [:show]
  resource :users, only: [:update, :edit], path: 'user' do
    get :edit_password
    patch :update_password
  end
  root 'posts#index'
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end


  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' } # todo: убери потом измнения юзера из дивайса

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

