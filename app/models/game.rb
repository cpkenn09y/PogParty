class Game < ActiveRecord::Base
  has_many :pogs

  def initialize(keen, ie, number_of_pogs=10 )
    @number_of_pogs = number_of_pogs
    @pogs = []
    create_pogs
  end

  def create_pogs
    @number_of_pogs.times do
      debugger
      @pogs << Pog.create()
    end
  end

  def flip_pogs
    @game
  end

  def game_over?
    @game = Game.find
    @game.pogs.each do |pog|
      return false if pog.status == 'unflipped'
    end
    true
  end

  def drop_slammer
    flipped   = []
    unflipped = []
    @game.pogs.each do |pog|
      if [true,false].sample == true
        pog.status = 'flipped'
        flipped << pog
      else
        unflipped << pog
      end
    end
    render :json => {flipped: flipped, unflipped: unflipped}.to_json
  end

end
