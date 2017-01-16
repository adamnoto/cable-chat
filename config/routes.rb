Rails.application.routes.draw do
  root to: "rooms#index"

  resources :rooms, only: [:index]
  resources :chats, only: [:create] do
    member do
      get :generate_checkout_token
    end
  end

  resources :pay, only: [] do
    post :notify
    get :finish
    get :unfinish
    get :error
  end

  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
