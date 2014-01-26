PogParty::Application.routes.draw do

  resources :players

  devise_for :players, :controllers => { :omniauth_callbacks => "players/omniauth_callbacks" }

  devise_scope :player do
     get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_player_session
  end

  root :to => 'games#index'
end
