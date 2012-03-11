Ares::Application.routes.draw do
  devise_for :users

  root to: 'users#index'

  resources :users do
    get :search, on: :collection
    get :self, on: :collection
  end
  resources :groups do
    get :search, on: :collection
    resources :users
  end
end
