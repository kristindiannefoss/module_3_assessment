Rails.application.routes.draw do
  get 'store/index'

  get 'store/show'

  root 'items#index'

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]
  resources :stores,  only: [:index, :show]

  namespace :api do
    namespace :v1 do
      resources :items, only: [:index, :show, :destroy, :create]
    end
  end
end
