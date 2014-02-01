class GamesController < ApplicationController

	def index
		# @open_games = Game.where(status: 'open')
		@game = Game.create()
		debugger
	end

	def create # APPEARS AS BUTTON AT TOP OF INDEX
		# need to complete helper method current_player to use!
		game = Game.create(player1_id: current_player.id)
	end

	def join
		# FOR PLAYER 2 JOINING GAME
	end

	def run_game
		game_id = params[:game_id]
		pog_status = drop_slammer(game_id, 1)
		return determine_and_set_winner(game_id) if game_over?(game_id)
		pog_status
	end

end
