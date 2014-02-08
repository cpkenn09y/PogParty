class Game < ActiveRecord::Base
  has_many :pogs

  def init(number_of_pogs=10 )
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
  #     return false if pog.status == 'face_down'
  #   end
  #   true
  # end

  def drop_slammer
    face_up   = []
    face_down = []
    self.pogs.each do |pog|
      if [true,false].sample == true
        pog.status = 'face_up'
        face_up << pog
      else
        face_down << pog
      end
    end
    {face_up: face_up, face_down: face_down}
  end

end
