Rails.application.routes.draw do
  resources :rooms, only: [:index]
  get 'rooms/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
