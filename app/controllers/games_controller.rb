class GamesController < ApplicationController
	
	def index
		@open_games = Game.where(status: 'open')
	end

	def create # APPEARS AS BUTTON AT TOP OF INDEX
		game = Game.create(player1_id: current_player.uid)
	end

	def join
		# FOR PLAYER 2 JOINING GAME
	end

	def run_game
		game_id = params[:game_id]
		pog_status = drop_slammer(game_id)
		return determine_and_set_winner(game_id) if game_over?(game_id)
		pog_status
	end

	private

	def game_over?(game_id)
		game = Game.find(game_id)
		game.pogs.each do |pog|
			return false if pog.status == 'unflipped'
		end
		true
	end

	def determine_and_set_winner(game_id)
		@game = Game.find(game_id)
		player1_id = @game.player1_id
		player2_id = @game.player2_id

		player1_winnings = 0
		player2_winnings = 0

		@game.pogs.each do |pog|
			pog.user_id == player1_id ? (player1_winnings += 1) : (player2_winnings += 1)
		end

		if player1_winnings == player2_winnings
			return 'draw'
		elsif player1_winnings > player2_winnings
			player1 = Player.find(player1_id)
			return player1.email
		else
			player2 = Player.find(player2_id)
			return player2.email
		end
	end

	def drop_slammer(game_id, player_id)
		game = Game.find(game_id)
		player = Player.find(player_id)
		flipped 	= []
		unflipped = []
		game.pogs.each do |pog|
			if [true,false].sample == true
				pog.status = 'flipped'
				player.pogs << pogs 		# MAKE SURE OVERWRITES FORMER USER_ID
				flipped << pog
			else
				unflipped << pog
			end
		end
		render :json => {flipped: flipped, unflipped: unflipped}.to_json
	end
end
