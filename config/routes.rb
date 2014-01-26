PogParty::Application.routes.draw do

  root :to => 'games#index'

  resources :players, only: [:new, :create] do
  	resources :pogs, only: [:new, :create]
  	resources :games, only: [:create]
  end

  resources :games, only: [:index, :new, :create]
end
