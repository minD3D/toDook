Rails.application.routes.draw do
  get 'events/create' => 'events#create'

  get 'home/friend'
  get 'home/edit/:id' => 'home#edit'
  get 'home/update/:id' => 'home#update'
  get 'home/destroy/:id' => 'home#destroy'

  post '/friendships' => 'friendships#create'
  delete '/friendships' => 'friendships#destroy'

  resources :events, only: [:create, :destroy]
  devise_for :users

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
