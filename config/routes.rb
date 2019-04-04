Rails.application.routes.draw do
  get 'messages/index'
  devise_for :users, controllers: { registrations: 'registrations', confirmations: 'confirmations' }
  resources :profiles do
    resources :requests, only: [:create, :index] do
      member do
        patch :accept
        patch :reject
      end
    end
    resources :comments, only: [:create]
  end
  resources :conversations do
    resources :messages
  end
  resources :comments, only: [:create] do
    resources :likes, only: [:create]
  end
  get 'static/index'
  root 'static#index'
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
