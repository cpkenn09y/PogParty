class GamesController < ApplicationController

	def index
		# @open_games = Game.where(status: 'open')
		@game = Game.create()
		@game_id = @game.id
		@game.init
	end

	def create # APPEARS AS BUTTON AT TOP OF INDEX
		# need to complete helper method current_player to use!
		game = Game.create(player1_id: current_player.id)
	end

	def join
		# FOR PLAYER 2 JOINING GAME
		# FOR PLAYER 2 JOINING GAME
	end

	def run_game
		game_id = params[:game_id]
		@game = retrive_game_object(game_id)
		pog_status = @game.drop_slammer
		debugger
		return determine_and_set_winner(game_id) if game_over?(game_id)
		pog_status
		# render :json => {flipped: flipped, unflipped: unflipped}.to_json
	end

	private

	def retrive_game_object(game_id)
		Game.where(id: game_id)[0]
	end

end
