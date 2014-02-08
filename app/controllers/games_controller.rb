class GamesController < ApplicationController

	def index
		# @open_games = Game.where(status: 'open')
		@game = Game.create()
		@game_id = @game.id
		@game.init
		@pog_ids = []
		@game.pogs.each {|pog| @pog_ids << pog.id}
	end

	def create
		game = Game.create(player1_id: current_player.id)
	end

	def run_game
		game_id = params[:game_id].to_i
		@game = retrive_game_object(game_id)
		pog_status = @game.drop_slammer
		render :json => pog_status
	end

	private

	def retrive_game_object(game_id)
		Game.where(id: game_id)[0]
	end

end
