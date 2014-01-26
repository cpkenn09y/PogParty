PogParty::Application.routes.draw do

  resources :players

  devise_for :players, :controllers => { :omniauth_callbacks => "players/omniauth_callbacks" }

  root :to => 'games#index'
end
