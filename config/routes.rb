PogParty::Application.routes.draw do

  root :to => 'game#index'

  resources :games, only: [:new, :edit, :update]

  post "games/run_game", to: "game#run_game", as: :run_game

end
