PogParty::Application.routes.draw do

  resources :players, only: [:new, :create] do
  	resources :pogs, only: [:new, :create, :show]
  	resources :games, only: [:new, :create, :show]
  end

  post "games/:game_id/run_game", to: "games#run_game", as: :run_game

  root :to => 'games#index'

end
