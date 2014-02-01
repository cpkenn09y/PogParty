PogParty::Application.routes.draw do

  devise_for :installs

	# does not consider devise, will revise later
  resources :players, only: [:new, :create] do
  	resources :pogs, only: [:new, :create, :show]
  	resources :games, only: [:new, :create, :show]
  end

  # resources :pogs, only: [:new, :create]
  # resources :games, only: [:index, :create]
  post "games/:game_id/run_game", to: "games#run_game", as: :run_game

  devise_for :players, :controllers => { :omniauth_callbacks => "players/omniauth_callbacks" }

  devise_scope :player do
     get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_player_session
  end

  root :to => 'games#index'

end
