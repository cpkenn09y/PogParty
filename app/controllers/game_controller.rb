class GameController < ApplicationController

	def index

	end

	def run_game
		render :json => {face_down: [0, 3, 4], unflipper: [1, 2, 5, 6, 7]}.to_json
	end


	private
	def drop_slammer
		game = Game.find(params[:game_id])
		face_down 	= []
		face_up = []
		game.pogs.each do |pog|
			if [true,false].sample == true
				pog.status = 'face_down'
				face_down << pog
			else
				face_up << pog
			end
		end
		{face_down: face_down, face_up: face_up}.to_json
	end
end
