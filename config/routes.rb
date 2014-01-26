PogParty::Application.routes.draw do

  root :to => 'games#index'

  resources :players, only: [:new, :create] do
  	resources :pogs, only: [:new, :create]
  	resources :games, only: [:index, :create]
  end

  devise_for :players, :controllers => { :omniauth_callbacks => "players/omniauth_callbacks" }

  devise_scope :player do
     get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_player_session
  end

end
