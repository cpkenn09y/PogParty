class Game < ActiveRecord::Base
  has_many :pogs

  def init(number_of_pogs=10 )
    # debugger
    @number_of_pogs = number_of_pogs
    create_pogs
  end

  def create_pogs
    @number_of_pogs.times do
      self.pogs.build().save
    end
  end

  # def flip_pogs
  #   @game
  # end

  # def game_over?
  #   @game = Game.find
  #   @game.pogs.each do |pog|
  #     return false if pog.status == 'unflipped'
  #   end
  #   true
  # end

  def drop_slammer
    flipped   = []
    unflipped = []
    self.pogs.each do |pog|
      if [true,false].sample == true
        pog.status = 'flipped'
        flipped << pog
      else
        unflipped << pog
      end
    end
    {flipped: flipped, unflipped: unflipped}
  end

end
