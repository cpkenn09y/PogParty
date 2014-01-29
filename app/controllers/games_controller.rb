class GamesController < ApplicationController

	def index

	end

	def drop_slammer(game_id)
		game = Game.find(game_id)
		flipped 	= []
		unflipped = []
		game.pogs.each do |pog|
			if [true,false].sample == true
				pog.status = 'flipped'
				flipped << pog
			else
				unflipped << pog
			end
		end
		{flipped: flipped, unflipped: unflipped}.to_json
	end
end
