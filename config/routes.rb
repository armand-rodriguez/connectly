Rails.application.routes.draw do
  get 'messages/index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
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
  get 'static/index'
  root 'static#index'
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
